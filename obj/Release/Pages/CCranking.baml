   M S B A M L   `   `   `  ����   CodonComposer$    CodonOptimizer.Pages.CCranking   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     Z VFirstFloor.ModernUI, Version=1.0.6.0, Culture=neutral, PublicKeyToken=2d21ec3cd074c59a0mui&http://firstfloorsoftware.com/ModernUI  .��� $��0,10,0,0q�  � RowDefinitions  �� $
��Auto � � ColumnDefinitions �� $
��Auto �.+��� -   $��AddORFeomeButton��$��Add ORFeome��$��0��$	��150��$��30��$��20,50,466,374q� � ToolTip _� .���� .+��� $
��Bold"�Adding ORFeome�� ZXPlease upload an ORFeome. The file has to be .FASTA file and contain CDS sequences only!�� -   $��ORFeomeInfoRichTextBox��$��0��$��0��$
��Left=�$��24��$��
289,53,0,0q�$	��Top=�$��58�� �� 
IsReadOnly . $��1q� J� RenderTransformOrigin$ 
0.48,0.333&� �� TextAlignment$ Right=���Z� . �/� .T�J� .*�.*��� -    ��Name$ InfoRichTextBox�� _� .���� .+��� $
��Bold"�Informations about ORFeome�� 42There you can see informations about your ORFeome.�� -   $��CCrankButton��$%��Calculate codon context ranking��$
��Left=�$	��Top=�$	��700��$��50��$��20,141,-87,0q� _� .���� .+��� $
��Bold"�Counting CC ranking�� 86When you use this button the CC ranking will be count.�� -   $��CPSRichTextBox��$��0��$��0��$
��Left=�$	��314��$	��700��$��20,243,-90,-105q�$	��Top=� . $��1q���Z�  � BindingGroup &   System.Windows.Data.BindingGroup  . �/� .T�J� .*�.*��� -   $ CCRankInfoRichTextBox��� -   $��CCProgressBar��$��0��$
��Left=�$��8��$��20,219,-89,0q�$	��Top=�$	��700��z�V� .~���  �� ScaleY$ -1Q��� �� T� �� $��CDS's:��$
��Left=�$��
218,53,0,0q�$	��Top=�$��24                ��$��52��$��15(�$
��Bold"��� $��STEP 1: Add ORFeome��$
��Left=�$��	20,10,0,0q�$	��Top=�$
��Bold"�$��14(��� $#��STEP 2: Calculate CC ranking ��$
��Left=�$��
20,108,0,0q�$	��Top=�$
��Bold"�$��14(�