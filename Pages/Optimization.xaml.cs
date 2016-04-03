﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using CodonOptimizer.Classes;
using FirstFloor.ModernUI.Windows.Controls;
using System.Data;
using System.IO;
using Microsoft.VisualBasic.FileIO;
using System.ComponentModel;

namespace CodonOptimizer.Pages
{
    /// <summary>\
    /// </summary>
    public partial class Optimization : UserControl
    {
        public Optimization()
        {
            InitializeComponent();
            SaveToFASTAButton.IsEnabled = false;
            LoadORFButton.IsEnabled = false;
            OptimizeORFButton.IsEnabled = false;
            MaximalizeRadioButton.IsEnabled = false;
            MinimalizeRadioButton.IsEnabled = false;
            MaximalizeRadioButton.IsChecked = true;
            Optimizer.ReproductiveCyclesNumber = 1000;
            Optimizer.PopulationSize = 50;
            Optimizer.TournamentSize = 25;
        }

        #region GLOBAL VARIABLES
        /// <summary>
        /// ORF object
        /// </summary>
        public ORF ORF { get; set; }

        /// <summary>
        /// Background worker
        /// </summary>
        private BackgroundWorker worker = new BackgroundWorker();

        /// <summary>
        /// Optimizer object
        /// </summary>
        private Optimizer Optimizer { get; set; }

        /// <summary>
        /// maximalized ORF object
        /// </summary>
        List<string> optimizedORF;

        /// <summary>
        /// A string of extensions for initializeOpenFileDialog method
        /// </summary>
        string extensions;
        
        /// <summary>
        /// temporary TextBox
        /// </summary>
        TextBox textBox;

        /// <summary>
        /// DataTable object
        /// </summary>
        private DataTable Data;

        /// <summary>
        /// Dialog results
        /// </summary>
        Nullable<bool> openResult;

        /// <summary>
        /// OpenFileDialog object
        /// </summary>
        private Microsoft.Win32.OpenFileDialog openFileDialog;

        /// <summary>
        /// SaveFileDialog object
        /// </summary>
        private Microsoft.Win32.SaveFileDialog saveFileDialog;

        #endregion

        #region METHODS
        /// <summary>
        /// OpenFileDialog initialization method
        /// </summary>
        private void initializeOpenFileDialog(string ext)
        {
            this.openFileDialog = new Microsoft.Win32.OpenFileDialog();
            this.openFileDialog.FileName = ""; // default file name
            this.openFileDialog.Filter = ext; // filter files by extension
            this.openFileDialog.Multiselect = false; // Only one file
            this.openFileDialog.Title = "Open ORFeome file..."; // title text
        }

        /// <summary>
        /// saveFileDialog
        /// </summary>
        private void saveFileDialogInitialize(string ext)
        {
            this.saveFileDialog = new Microsoft.Win32.SaveFileDialog();
            this.saveFileDialog.FileName = ""; // default file name
            this.openFileDialog.Filter = ext; // filter files by extension
            this.openFileDialog.Multiselect = false; // Only one file
            this.openFileDialog.Title = "Save .FASTA..."; // title text
        }

        /// <summary>
        /// LoadORFButton Click event handler
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void LoadORFButton_Click(object sender, RoutedEventArgs e)
        {
            int columnCounter = 0;
            Data = new DataTable();
            ORF = new ORF();
            // extensions setting
            extensions = "Fasta files|*.fa;*.fas;*.fasta";
            // openFileDialog method initialization
            initializeOpenFileDialog(extensions);

            // show openFileDialog file dialog
            Nullable<bool> openResult = openFileDialog.ShowDialog();

            if (openResult == true)
            {
                string file = openFileDialog.FileName; // file handler

                // sequenceParser method initialization
                var tupleTemp = SeqParser.sequenceParser(file);
                ORF.ORFSeq = tupleTemp.Item1;
                // codonToAminoParser method initialization
                ORF.AminoORFseq = SeqParser.codonToAminoParser(ORF.ORFSeq);
                // sequence to data grid
                Data.Columns.Add(new DataColumn("CPB"));
                foreach (var k in ORF.AminoORFseq)
                {
                    Data.Columns.Add(new DataColumn(columnCounter.ToString()));
                    columnCounter++;
                }
                
                // CPBcalculator method initialization
                OriginalCPBscoreTextBox.Text = ORF.CPBcalculator(ORF.ORFSeq).ToString();

                // datagrid filling
                ORF.AminoORFseq.Insert(0, "");
                ORF.ORFSeq.Insert(0, OriginalCPBscoreTextBox.Text);
                Data.Rows.Add(ORF.AminoORFseq.ToArray());
                Data.Rows.Add(ORF.ORFSeq.ToArray());
                ORF.AminoORFseq.RemoveAt(0);
                ORF.ORFSeq.RemoveAt(0);
                OptimizationDataGrid.ItemsSource = Data.DefaultView;

                // Enabling checkboxes and button
                MaximalizeRadioButton.IsEnabled = true;
                MinimalizeRadioButton.IsEnabled = true;
                OptimizeORFButton.IsEnabled = true;
            }
            else
            {
                // modern dialog initialization
                string message = "Something went wrong. Probably you tried to use an improper file. Try again. \nFor more information about using Optimalizator check the \"How to use\" page.";
                ModernDialog.ShowMessage(message.ToString(), "Warning", MessageBoxButton.OK);
            }
        }

        /// <summary>
        /// UploadRankingButton_Click event handler
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void UploadRankingButton_Click(object sender, RoutedEventArgs e)
        {
            // extensions setting
            extensions = "CSV files|*.csv";
            // openFileDialog method initialization
            initializeOpenFileDialog(extensions);

            // show openFileDialog file dialog
            openResult = openFileDialog.ShowDialog();

            if (openResult == true)
            {
                string file = openFileDialog.FileName; // file handler
                // .csv parsing
                using (TextFieldParser parser = new TextFieldParser(openFileDialog.InitialDirectory + openFileDialog.FileName))
                {
                    CCranking.CCranker = new CCranker();
                    parser.SetDelimiters(new string[] { ";" });

                    while (!parser.EndOfData)
                    {
                        string[] fields = parser.ReadFields();
                        CCranking.CCranker.CPS.Add(fields[0], Convert.ToDouble(fields[1]));
                    }
                }
                LoadORFButton.IsEnabled = true;
            }
        }

        /// <summary>
        /// initialization of optimization
        /// </summary>
        private void optimizationInitialization(object sender, DoWorkEventArgs e)
        {
            optimizedORF = new List<string>();
            optimizedORF = Optimizer.optimizeORF(ORF.ORFSeq, ORF.AminoORFseq, sender, e);
        }

        /// <summary>
        /// OptimizeORFButton_Click event handler
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void OptimizeORFButton_Click(object sender, RoutedEventArgs e)
        {
            // new optimizer object 
            Optimizer = new Optimizer();
            textBox = new TextBox();

            // Background worker settings
            worker = new BackgroundWorker();
            worker.DoWork += new DoWorkEventHandler(optimizationInitialization);
            worker.ProgressChanged += new ProgressChangedEventHandler(worker_ProgressChanged);
            worker.RunWorkerCompleted += new RunWorkerCompletedEventHandler(worker_RunWorkerCompleted);
            worker.WorkerReportsProgress = true;

            // if maximalization is checked
            if (MaximalizeRadioButton.IsChecked == true)
            {
                Optimizer.optimizationMode = 1;
                textBox = MaxCPBscoreTextBox;
                worker.RunWorkerAsync();
                //optimizationInitialization(MaxCPBscoreTextBox);
            }
            // if minimalization is checked
            if (MinimalizeRadioButton.IsChecked == true)
            {
                Optimizer.optimizationMode = 0;
                textBox = MinCPBscoreTextBox;
                worker.RunWorkerAsync();
                //optimizationInitialization(MinCPBscoreTextBox);
            }
        }

        /// <summary>
        /// worker_RunWorkerCompleted 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void worker_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            textBox.Text = ORF.CPBcalculator(optimizedORF).ToString();
            optimizedORF.Insert(0, textBox.Text);
            Data.Rows.Add(optimizedORF.ToArray());
            OptimizationDataGrid.ItemsSource = Data.DefaultView;
            SaveToFASTAButton.IsEnabled = true;
        }

        /// <summary>
        /// worker_ProgressChanged
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void worker_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            OptimizationProgressBar.Value = e.ProgressPercentage;
        }

        /// <summary>
        /// CurrentRankingCheckBox_Checked event handler
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void CurrentRankingCheckBox_Checked(object sender, RoutedEventArgs e)
        {
            UploadRankingButton.IsEnabled = false;
        }

        /// <summary>
        /// CurrentRankingCheckBox_UnChecked event handler
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void CurrentRankingCheckBox_Unchecked(object sender, RoutedEventArgs e)
        {
            UploadRankingButton.IsEnabled = true;
        }

        /// <summary>
        /// Checking stuff when page is visible 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void OptimizationPage_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            CurrentRankingCheckBox.IsEnabled = CCranking.currentRankingCheckBoxIsEnabled;
        }

        /// <summary>
        /// SaveToFASTAButton_Click event handler
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void SaveToFASTAButton_Click(object sender, RoutedEventArgs e)
        {
            // extensions setting
            extensions = "Fasta files|*.fa;*.fas;*.fasta";
            saveFileDialogInitialize(extensions);
            
            openResult = saveFileDialog.ShowDialog();

            if (openResult == true)
            {
                using (System.IO.StreamWriter outFile = new System.IO.StreamWriter(saveFileDialog.FileName + @".fasta"))
                {
                    for(int i=1; i<Data.Rows.Count; i++) 
                    {
                        // sequence header
                        outFile.WriteLine(">optimized by ORF Optimizer with score: " + Data.Rows[i].ItemArray[0]);
                        for (int j = 1; j < Data.Rows[i].ItemArray.Count(); j++)
                        {
                            // 72 nucleotides for line 
                            outFile.Write(Data.Rows[i].ItemArray[j]);
                            if (j % 24 == 0)
                            {
                                outFile.WriteLine();
                            }
                        }
                        outFile.WriteLine();
                    }
                }
            }
        }

        /// <summary>
        ///  RemoveSelectedButton_Click event handler
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void RemoveSelectedButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var currentRowIndex = OptimizationDataGrid.SelectedIndex;
                Data.Rows.RemoveAt(currentRowIndex);
                OptimizationDataGrid.ItemsSource = Data.DefaultView;
            }
            catch
            {
                string message = "Please, select a row for removing.";
                ModernDialog.ShowMessage(message.ToString(), "Warning", MessageBoxButton.OK);
            }
        }
        #endregion
    }
}
