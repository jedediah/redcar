
module Redcar
  class RedcarPlugin < Redcar::Plugin
    def self.load(plugin)
      main_menu "File" do
        item "New",        NewTab
        item "Open",       OpenTabCommand
        separator
        item "Save",       SaveTab
        item "Save As",    SaveTabAs
        item "Save All",   SaveAllTabsCommand
        #      item "Revert",     RevertTab
        separator
        item "Close",      CloseTab
        item "Close All",  CloseAllTabs
        item "Undo Close", UndoCloseEditTabCommand
        separator
        item "Quit",       Quit
      end
      
      main_menu "Edit" do
        item "Undo",     Undo
        item "Redo",     Redo
        separator
        item "Cut",      Cut
        item "Copy",     Copy
        submenu "Paste" do
          item "Paste",    Paste
          item "Paste Cycle", PasteCycle
          item "Paste History", PasteHistory
        end
        separator
        item "Find",               Find
        item "Incremental Search", AskIncrementalSearch
        submenu "Move" do
          item "Forward Character",    ForwardCharacterCommand
          item "Backward Character",   BackwardCharacterCommand
          separator
          item "Forward Word",    ForwardWordCommand
          item "Backward Word",   BackwardWordCommand
          separator
          item "Line Start",    LineStart
          item "Line End",   LineEnd
          separator
          item "Goto Line",  AskGotoLineCommand
        end
        item "Kill Line", KillLine
        separator
        submenu "Convert" do
          item "TO UPPERCASE", ToUppercase
          item "to lowercase", ToLowercase
          item "To Title Case", ToTitlecase
        end
        submenu "Indent" do
          item "Auto",  IndentLine
          item "Left",  IndentLeftCommand
          item "Right", IndentRightCommand
        end
        separator
        submenu "Select" do
          item "Word",          SelectWordCommand
          item "Line",          SelectLine
          item "Current Scope", SelectScopeCommand
        end
      end
      
      main_menu "View" do
        item "Split Horizontal",  SplitHorizontal
        item "Split Vertical",    SplitVertical
        item "Unify All",         UnifyAll
      end

      Bundle.build_bundle_menus
      
      plugin.transition(FreeBASE::LOADED)
    end
    
    on_start do
      Hook.attach(:redcar_start) do
        App.new_window
      end
    end
  end
end
