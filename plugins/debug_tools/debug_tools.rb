
module Com::RedcarIDE
  class DebugTools < Redcar::Plugin
    class PrintCommandHistory < Redcar::Command
      norecord
      
      def execute
        puts "Command History"
        puts Redcar::CommandHistory.history.reverse[0..15].map{|com| "  " + com.to_s}
      end
    end

    class PrintScopeTree < Redcar::EditTabCommand
      norecord
      
      def execute
        puts "Scope Tree"
        puts tab.document.parser.root.pretty(0)
      end
    end
    
    class PrintScopeAtCursor < Redcar::EditTabCommand
      norecord
    
      def execute
        puts "Scope at cursor"
        puts tab.doc.cursor_scope.inspect
      end
    end

    pch = PrintCommandHistory
    pst = PrintScopeTree
    psac = PrintScopeAtCursor
    on_start do
      main_menu "Debug" do
        item "Print Command History", pch
        item "Print Scope Tree", pst
        item "Print Scope at Cursor", psac
      end
    end
  end
end

#require File.dirname(__FILE__) + "/spec/spec.rb"
