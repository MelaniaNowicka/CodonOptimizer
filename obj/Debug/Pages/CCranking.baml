   M S B A M L   `   `   `  ����  CodonOptimizer!    CodonOptimizer.Pages.CCrank   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      Z VFirstFloor.ModernUI, Version=1.0.6.0, Culture=neutral, PublicKeyToken=2d21ec3cd074c59a0mui&http://firstfloorsoftware.com/ModernUI  5      .��5
      �    ContentRoot#��[  6     � RowDefinitions  5   
   �� 5      $��60 �6   �� 5      $��* �6    � ColumnDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $��* �6   .+�5   
   �� -   5        $��AddORFeomeButton��5      $��Add ORFeome��6)   $��0��6?   $	��150��6O   $��30��6[   $��0,0,0,30q�6g    � ToolTip 5      _� 5      .��5      �� .+�5      �� $
��Bold"�6$   Adding ORFeome6F   �� 5      ZXPlease upload an ORFeome. The file has to be .FASTA file and contain CDS sequences only!6~   5      5      5      �� 5   
   -   5        $��ORFeomeInfoRichTextBox��5      $��0��64   $��1��6B   $
��Left=�6R   $��50��6m   $��25,0,0,0q�6y   $	��Top=�6�   $	��550��6�    �� 
IsReadOnly . $��1q�6�   ��6�   Z� . �5      /� .T�5      J� .*�6   .*�5       �� -   5         ��Name$ InfoRichTextBox��5       5!      5"       5#      _� 5$      .��5%      �� .+�5&      �� $
��Bold"�6$   Informations about ORFeome6R   �� 5'      42There you can see informations about your ORFeome.6X   5(      5)      5+      �� 5,   
   -   5        $��CCrankButton��5,      $��Count codon context rank��6%   $��1��6H   $��1��6X   $
��Left=�6e   $	��Top=�6�   $	��550��6�   $��50��6�   $��	25,10,0,0q�6�    5-   
   _� 5.      .��5/      �� .+�50      �� $
��Bold"�6    Counting CC ranking6G   �� 51      86When you use this button the CC ranking will be count.6\   52      53      55      �� 56   
   $��1��6   $��1��6#   $
��Left=�63   $	��100��6N   $	��550��6[   $��	25,85,0,0q�6g   $	��Top=�6z    . $��1q�6�   ��6�   Z� . �57      /� .T�58      J� .*�6   .*�59      �� -   5        $ CCRankInfoRichTextBox��59      5:      5;      5<      5=      5>      