   M S B A M L   `   `   `  ����   CodonComposer%    CodonOptimizer.Pages.Parameters   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     @d2http://schemas.microsoft.com/expression/blend/2008     Z VFirstFloor.ModernUI, Version=1.0.6.0, Culture=neutral, PublicKeyToken=2d21ec3cd074c59a0mui&http://firstfloorsoftware.com/ModernUI  .��� $��	0,10,0,40q�  J� RenderTransformOrigin$  0.499,0.515&� � RowDefinitions �� $	��300 ��� $��* � � ColumnDefinitions �� $
��Auto �.+� � $�� ��$
��Left=�$	��261��$��21,29,-560,0q�$	��Top=�$	��778�����	#FF333333$��2q� � $�� ��$
��Left=�$	��194��$��21,46,-559,0q�$	��Top=�$	��778�����	#FF333333$��2q�$��1���� $��SEQUENCE PARAMETERS��$
��Left=�$��19��$��22,10,-107,0q�$	��Top=�$	��223��$
��Bold"�$��14(��� $��ALGORITHM PARAMETERS��$
��Left=�$��19��$��21,22,-31,0q�$	��Top=�$	��223��$
��Bold"�$��14(�$  0.578,1.105&�$��1���� $��Population size:��$
��Left=�$��17��$��45,103,-65,0q�$��1��$	��Top=�$	��106��$
��Bold"��� $��Reproduction cycles:��$
��Left=�$��17��$��45,60,-92,0q�$��1��$	��Top=�$	��130��$
��Bold"��� $��Mutation probability:��$
��Left=�$��17��$��45,146,-49,0q�$��1��$	��Top=�$	��141��$
��Bold"��� $��Crossover probability:��$
��Left=�$��17��$��45,187,-50,0q�$��1��$	��Top=�$	��141��$
��Bold"��� -   $��MutationProbabilitySlider�� � Value$
 0.10Q�$
��Left=�$��17��$��247,146,-225,0q�$��1��$	��Top=�$��95�� � Maximum$ 1Q� � SmallChange$
 0.01Q��� -   $ ��CrossoverProbabilitySlider��$
 0.75Q�$
��Left=�$��17��$��247,187,-224,0q�$��1��$	��Top=�$��95��$ 1Q�$
 0.01Q��� -   $ ��MutationProbabilityTextBox��$
��Left=�$��17��$��357,145,-263,0q�$��1�� �� TextWrapping$
 Wrap=�$	��Top=�$��34��$��10(� �� TextAlignment$ Right=�����  �� ElementName$ MutationProbabilitySlider��	 �� Path$	 Value�
 �� UpdateSourceTrigger$
 PropertyChanged=� �� StringFormat$
 0.00���� -   $!��CrossoverProbabilityTextBox��$
��Left=�$��17��$��357,187,-266,0q�$��1��$
 Wrap=�$	��Top=�$��34��$��10(�$ Right=����� $  CrossoverProbabilitySlider��$	 Value�$
 PropertyChanged=�$
 0.00���� -   $��ReproductionCyclesTextBox��$
��Left=�$��20��$��247,62,-262,0q�$��1��$
 Wrap=�$	��Top=�$	��144��$��11(�$
��1000��$ Right=��� -   $��PopulationSizeTextBox��$
��Left=�$��20��$��247,105,-261,0q�$��1��$
 Wrap=�$	��Top=�$	��144��$��50��$��11(�$ Right=��� $��Tournament size:��$
��Left=�$��17��$��456,103,-474,0q�$��1��$	��Top=�$	��130��$
��Bold"�}�. �� $
��Left=�$��19��$��456,66,-550,0q�$	��Top=�$	��203��$
��Bold"�$��14(�$  0.578,1.105&�$��1��.���� -   $"��AdditionalParametersCheckbox��$��Use additional parameters�� � ToolTip _� .���� .+��� $
��Bold"�Use additional parameters�� 20Chceck this option to add additional parameters.�� 64Otherwise the algorithm will use default parameters.�� -   $��TournamentSizeTextBox��$
��Left=�$��20��$��585,103,-568,0q�$��1��$
 Wrap=�$	��Top=�$��93��$��11(�$��25��$ Right=��� $��Stop criterion:��$
��Left=�$��17��$��456,145,-454,0q�$��1��$	��Top=�$	��130��$
��Bold"�}�. �� -	    ��Name$ StopCriterionTextBox��$
��Left=�$��20��$��585,142,-544,0q�$��1��$
 Wrap=�$	��Top=�$��93��$��11(�$��25��$ Right=�.�� _� .���� .+��� $
��Bold"� �� TextAlignment$
 Left=�Additional stop criterion�� $
 Left=�:8Set a number of cycles that do not generate improvement..���� $��Additional restrictions��$
��Left=�$��25��$��45,71,-65,0q�$	��Top=�$	��222��$
��Bold"��� -
   $"��AHomopolymersRemovalCheckBox��$��Remove A-homopolymers��$
��Left=�$��31��$��45,96,-12,0q�$	��Top=�$	��171���� -   $'��!RestrEnzymeSitesToRemovalCheckBox��$%��Remove restriction enzyme sites��$
��Left=�$��31��$��328,63,-356,0q�$	��Top=�$	��249��$
��Bold"��� -   $!��RestrictionSitesPoolListBox��$
��Left=�$	��147��$��328,108,-233,0q�$	��Top=�$	��125��$��1q����	#FFC1C1C1 �� SelectionMode$ Extended=����� .R���  �� Orientation$ 
Horizontal=�.+��� ���� �� -   $&�� RestrictionSitesToRemovalListBox��$
��Left=�$	��147��$��645,108,-553,0q�$	��Top=�$	��125��$��1q�$ Extended=��� -   $��AddToRemovalButton��$��>>��$
��Left=�$��511,136,-368,0q�$	��Top=�$��75��$
��Bold"��� -   $��UndoAddToRemovalButton��$��<<��$
��Left=�$��511,177,-363,0q�$	��Top=�$��75��$
��Bold"��� $��Max below original:��$
��Left=�$��25��$��
45,186,0,0q�$	��Top=�$	��147��$
��Bold"��� $��Max under original:��$
��Left=�$��25��$��
45,220,0,0q�$	��Top=�$	��121��$
��Bold"��� -   $ MinimalNcTextBox��$��1��$��17��$��182,185,20,0q�$
 Wrap=�$	��Top=�$��10(�$ Right=��� -   $ MaximalNcTextBox��$��1��$
��Left=�$��17��$��182,220,0,0q�$
 Wrap=�$	��Top=�$��34��$��10(�$ Right=��� -    ��Name$' !NcRestrictionsMaintenanceCheckBox��$��Maintain original Nc��$
��Left=�$��31��$��
45,141,0,0q�$	��Top=�$	��171��