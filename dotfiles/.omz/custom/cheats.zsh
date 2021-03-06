# Keyboard Binds for each application/software and terminal Shortcuts
alias k-b=' echo -e "
\033[1;33mCommand:	What it does \033[0;31m\e[5m(Terminal Based)\033[0m
\e[96mCtrk + A\033[0m	\e[95mMoves the cursor to the start of a line
\e[96mCtrl + E\033[0m	\e[95mMoves the cursor to the end of a line
\e[96mCtrl + W\033[0m 	\e[95mDeletes the word before the cursor
\e[96mCtrl + U\033[0m	\e[95mDeletes from the start of the line to the current cursor position
\e[96mCtrl + K\033[0m	\e[95mDeletes from the current cursor position to the end of the line
\e[96mEsc + B\033[0m		\e[95mMoves the cursor to the beginning of the previous or current word
\e[96mAlt + B\033[0m 	\e[95mGoes back one word at a time
\e[96mAlt + F\033[0m 	\e[95mMoves forward one word at a time
\e[96mAlt + C\033[0m 	\e[95mCapitalizes letter where cursor is and moves to end of word
\e[96mCtrl + R          \e[95mReverse search previous executed commands
\e[96mCtrl + S          \e[95mFreez screen
\e[96mCtrl + Q          \e[95mUnfreeze screen 

\033[1;33mCommand:	What it does \033[0;31m\e[5m(Terminator)\033[0m
\e[96mCtrl+Shift+O                 \e[95mSplits terminal Horizontally (-)
\e[96mCtrl+Shift+E                 \e[95mSplits terminal Vertically   (|)
\e[96mCtrl+Shift+<Key Direction>   \e[95mMove parent dragbar to that direction
\e[96mAlt+<Key Direction>          \e[95mMove to the terminal which is located to that direction
\e[96mCtrl+Shift+S                 \e[95mHide or Show Scrollbar
\e[96mCtrl+Shift+F                 \e[95mSearch within terminal scrollbar
\e[96mCtrl+Tab                     \e[95mMove to next terminal within the same window tab
\e[96mCtrl+Shift+Tab               \e[95mMove to previouse terminal within the same window tab
\e[96mCtrl+Shift+C                 \e[95mCopy selected text to clipboard
\e[96mCtrl+Shift+V                 \e[95mCopy Paste clipboard text
\e[96mCtrl+Shift+W                 \e[95mClose the current terminal
\e[96mCtrl+Shift+X                 \e[95mMaximize the current terminal
\e[96mF11                          \e[95mFull screen"'
# Copy files cheats
alias c-f=' echo -e "
\033[1;33mCommand:	What it does \033[0;31m\e[5m(Rsync)\033[0m
\e[96mrsync -t *.csv -e ssh RServer-IP:/path/to/save			\e[95mCopy files to server
\e[96mrsync -avz file.csv -e ssh RServer-IP:/path/to/save		\e[95mCopy one file to a server

\033[1;33mCommand:	What it does \033[0;31m\e[5m(SCP)\033[0m
\e[96mscp -i private-key <file_path> user@RServer-IP:/path/on/Rserver    \e[95mCopy file to server
\e[96mscp -i private-key user@RServer-IP:/path/on/Rserver /path/to/save  \e[95mCopy file from server

\033[1;33mCommand:	What it does \033[0;31m\e[5m(Parallel SCP)\033[0m
\e[96mparallel-scp -h hosts.txt -l user_name -v /path/on/Local /path/to/Rserver \e[95mCopy file to multiple servers"'
# Tmux cheats
alias tmx=' echo -e "
\033[1;33mCommand:	What it does \033[0;31m\e[5m(Tmux)\033[0m
\e[96mtls                  \e[95mList sessions
\e[96mtns session-name     \e[95mNew session with custom name
\e[96mtat session-name     \e[95mAttach to a tmux session
\e[96mtks session-name     \e[95mKill tmux server
\e[96mtad session-name     \e[95mNew session in detached mode
\e[96mtkst session-name    \e[95mKill Detached session
\e[96mtm                   \e[95mStart a tmux session called r00t

\e[96mCtrl+a :kill-session \e[95mKill attached session

\e[96mCtrl+a c            \e[95mNew window
\e[96mCtrl+a d            \e[95mDetach from session
\e[96mCtrl+a <comma>      \e[95mRename window
\e[96mCtrl+a n            \e[95mSwitch to next screen
\e[96mCtrl+a p            \e[95mSwitch to previous screen
\e[96mCtrl+a =            \e[95mList all paste buffers
\e[96mCtrl+a c            \e[95mTo copy my text to my clipboard
\e[96mCtrl+a w            \e[95mList windows
\e[96mCtrl+a &            \e[95mKill current window
\e[96mCtrl+a <number>     \e[95mSwitch between windows by their number (works from 0-9)
\e[96mCtrl+a -            \e[95mSplit window vertically
\e[96mCtrl+a |            \e[95mSplit window horizontally
\e[96mCtrl+a o            \e[95mSwitch panes
\e[96mCtrl+a <space-bar>  \e[95mSwitch pane from horizontal to vertical view (works vice-verser)
\e[96mCtrl+a { and }      \e[95mSwap the current pane with the previous pane and current pane with the next pane
\e[96mCtrl+d              \e[95mClose pane
\e[96mCtrl+a !            \e[95mBreak pane to its own window

\e[96mCtrl+a [            \e[95mEnter copy Mode
\e[96mAlt+f               \e[95mMove right per word
\e[96mAlt+b               \e[95mMove left per word
\e[96mCtrl+f              \e[95mMove right per letter
\e[96mCtrl+b              \e[95mMove left per letter
\e[96mCtrl + <space-bar>  \e[95mStart of higlight
\e[96mAlt+w               \e[95mCopy higlighted text
\e[96mCtrl+a ]            \e[95mPaste text from tmux copy buffer
\e[96mCtrl+a y or y		  \e[95mCopy tmux copy selected text to buffer
\e[96mCtrl+a Y            \e[95mCopy current pane(s) directory

\e[96mCtrl+a I            \e[95mFetch plugins
\e[96mCtrl+a U            \e[95mUpdate plugins"'
# Vi cheat sheets
alias vm=' echo -e "
\033[1;33mCommand:	What it does \033[0;31m\e[5m(Vi)\033[0m
\e[96m :q       \e[95mQuit
\e[96m :w       \e[95mSave/Write
\e[96m :q!      \e[95mQuit without saving
\e[96m  I       \e[95mEnter Insert before cursor
\e[96m  a       \e[95mAppend after cursor

\e[96m Ctrl+r   \e[95mRedo
\e[96m Ctrl+e   \e[95mScroll the window down
\e[96m Ctrl+y   \e[95mScroll the window up
\e[96m Ctrl+f   \e[95mScroll down one page
\e[96m Ctrl+b   \e[95mScroll up one page
\e[96m H        \e[95mMove the cursor to the top of the window
\e[96m M        \e[95mMove the cursor to the middle of the window
\e[96m L        \e[95mMove the cursor to the bottom of the window
\e[96m gg       \e[95mGo to the top of file
\e[96m G        \e[95mGo to the bottom of file

\e[96m .        \e[95mRepeat last command done
\e[96m u        \e[95mUndo last action
\e[96m y        \e[95mYank/Copy

\e[96m dw       \e[95mDelete a from cursor position to end of word
\e[96m o        \e[95mCreate a new line below
\e[96m O        \e[95mCreate a new line above
\e[96m x        \e[95mDelete the character the cursor is over
\e[96m X        \e[95mDelete one character before (to the left of) the cursor
\e[96m dd       \e[95mDelete a line
\e[96m caw      \e[95mChange word
\e[96m cc       \e[95mChange line
\e[96m r<char>  \e[95mReplace character with <char>
\e[96m R        \e[95mTypeover (Replace)
\e[96m s        \e[95mSubstitute 1 char with string
\e[96m S        \e[95mSubstitute rest of line with string
\e[96m n        \e[95mNext string match
\e[96m N        \e[95mPrevious string match

\e[96m :set number    \e[95mInsert line numbers
\e[96m :r file        \e[95mInsert file after current line
\e[96m :/string       \e[95mSearch for string"'