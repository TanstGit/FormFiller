;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;            FORM FILL -BY Jeff Hisson 2/5/2019                         
;; FORM FILL is an AutoHotKey tool which will enable you to     
;; read in a tab delimted text file and output the data into a form.   
;; Each use requires some degree of editing as each form is slightly 
;; diffrent from the rest and coordinates on one computer will not     
;; always match another.                                                              
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;          READ FIRST:  How To Use                                           
;;  The first thing to note is that text preceded by a semicolon is      
;;  not included as part of the code. Typically these are instructions 
;;  or notes which explain something. In this script things that the     
;; user should edit are marked with *EDITABLE* and the default  
;; Example values are provided in the comment block with a letter
;; connecting the instructions to the editiable code.                   
;; If you overwrite a section of code you can always re-open         
;; The original file and use that as a refrence. Save often.                
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;////////////////////////////////////////////////////////////////////////////////////////////////////
;;////////////////////////////////////////////////////////////////////////////////////////////////////
;;////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             *Instructions - A* 
;;                      == SET FILE PATH ==
;;
;;    This is the location of the file which you are reading data from.    
;; 
;; The default value is myFile:="<insert file path>"                          
;; Where <insert file path> for example could be:
;; myFile:="C:\Users\jhisson\Desktop\DataIN.txt"
;; or myFile:="C:\DataIN.txt"           
;; or myFile:="C:\thisplace\thatplace\wherethefileis\DataIN.txt"  
;;     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;*EDITABLE-A*;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
myFile:="C:\Users\jhisson\Desktop\DataIN.txt"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;*EDITABLE-A*;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;////////////////////////////////////////////////////////////////////////////////////////////////////
;;////////////////////////////////////////////////////////////////////////////////////////////////////
;;////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; IGNORE THESE FIELDS THEY NEED NOT CHANGE       ;;
;; This portion of the code simply reads in the contents of myFile    ;;
;; into an array so it can be parsed in the main loop.                       ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
fileRead, plop, %myFile%                                        
getVal:=1 ; where to start.
myarray:=[]
loop, parse, plop, `n, `r
	myarray.push(strSplit(A_LoopField, "`t"))
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   IGNORE THESE FIELDS THEY NEED NOT CHANGE     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;////////////////////////////////////////////////////////////////////////////////////////////////////
;;////////////////////////////////////////////////////////////////////////////////////////////////////
;;////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CTRL + M IS THE TRIGGER THAT STARTS THE LOOP     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
^m::
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CTRL + M IS THE TRIGGER THAT STARTS THE LOOP     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;////////////////////////////////////////////////////////////////////////////////////////////////////
;;////////////////////////////////////////////////////////////////////////////////////////////////////
;;////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   IGNORE THESE FIELDS THEY NEED NOT CHANGE     ;;
;; This portion of the code initializes ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	for k in myarray
	{
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   IGNORE THESE FIELDS THEY NEED NOT CHANGE     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;////////////////////////////////////////////////////////////////////////////////////////////////////
;;////////////////////////////////////////////////////////////////////////////////////////////////////
;;////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             *Instructions - B* 
;;             == Create arrays for each Column ==
;;
;;  For each column in your source spreadsheet add a line in
;; The below editable section matching the following pattern:
;;        fieldX:=myarray[A_Index,X]
;; 
;;       for example if you have 3 columns the editiable section would  
;;       look like this:
;;
;;        field1:=myarray[A_Index,1]
;;        field2:=myarray[A_Index,2]
;;        field3:=myarray[A_Index,3]
;;     
;;        additionally you can add comments to describe them for
;;        example: 
;;
;;        field1:=myarray[A_Index,1]    ;;Column 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;*EDITABLE-B*;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		field1:=myarray[A_Index,1]                         ;;ETQ$NUMBER
		field2:=myarray[A_Index,2]                         ;;ETQ$NUMBER_ONLY
		field3:=myarray[A_Index,3]	             ;;ETQ$REVISION
		field4:=myarray[A_Index,4]                         ;;ETQ$EFFECTIVE_DATE
		field5:=myarray[A_Index,5]	             ;;ETQ$REVIEW_DATE
		field6:=myarray[A_Index,6]	             ;;DOCWORK_ORIGINATION_DATE
		field7:=myarray[A_Index,7]	             ;;DOCWORK_ORIGINATOR
		field8:=myarray[A_Index,8]	             ;;ETQ$APPROVERS
		field9:=myarray[A_Index,9]	             ;;ETQ$REVIEWERS
		field10:=myarray[A_Index,10]	             ;;ETQ$OFFLINE_DISTRIBUTION
		field11:=myarray[A_Index,11]	             ;;ETQ_DOCWORK_DEPARTMENT
		field12:=myarray[A_Index,12]	             ;;DOCWORK_CATEGORIES
		field13:=myarray[A_Index,13]	             ;;REQUESTED_BY
		field14:=myarray[A_Index,14]	             ;;REASON
		field15:=myarray[A_Index,15]	             ;;DOCWORK_TITLE
		field16:=myarray[A_Index,16]	             ;;ATTACHMENTS_P
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;*EDITABLE-B*;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;////////////////////////////////////////////////////////////////////////////////////////////////////
;;////////////////////////////////////////////////////////////////////////////////////////////////////
;;////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             *Instructions - C* 
;;                    == Wait for page Load ==
;;          This area contains commands that assure the form 
;;    is completely loaded before proceeding.            
;;       You can change the value of the sleep timer or remove
;;    comments from the image search function.
;;  *note: the image search function will require you to put an        
;;  image in a location. Image search is a tricky feature so 
;;  please ask if there is an issue.* 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;*EDITABLE-C*;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		Sleep 5000                                                                                                                                                     ;;Change this timer to whatever you like
		TrayTip NEW LOOP, CONFIRM A NEW PAGE HAS LOADED!!!!!

                                    ;;             ** REMOVE SEMICOLON IF IMAGE VARIFICATION REQUIRED**
		;;loop {
		;;ImageSearch, OutVarX, OutVarY, 0, 0, A_ScreenWidth, A_ScreenHeight,C:\mylocation\myimage.png          ;;Note the location C:\mylocation\myimage.png would need to be changed to whatever location the file is in
		;;if (ErrorLevel = 0)    ;if image was found
    		;;{
		;;MsgBox, 0, , Confirmed Value, 1                                                                                                                  ;; This msgbox can be removed and is optional
		;;break
    		;;}
       		;;}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;*EDITABLE-C*;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;////////////////////////////////////////////////////////////////////////////////////////////////////
;;////////////////////////////////////////////////////////////////////////////////////////////////////
;;////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             *Instructions - D* 
;;                    == Post DATA  to Form  ==
;;          This section contains the actions to post the data to
;;      a form. The DEFAULT SECTION is a repastable tool with 
;;       which contains common actions which can be applied to 
;;   imputing data. In the default section variables are identified
;;    by "<<<they type of variable you can enter>>>" and typically 
;;  followed by an explanation of what that does.
;;  Also note %field<<<X>>>%  is just a way of refrencing 
;; each column where x is the column you intend to pull data from.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                  DEFAULT BLOCK TOOLS-D
;;		TrayTip <<<text>>>>, %field<<<X>>>% <<<text>>>>		;; This command will display a tray tip displaying some text usally you can state what the current action is. This helps for debugging.   *optional*
;;		msgbox <<<text>>>>  %field<<<X>>>%   <<<text>>>>		;; This command will display a msgbox which you have to confirm in order to proceed.  *optional*	
;;		sleep <<<TIME>>> 					;; This command will create a brief pause in the event that loading 
;;		click <<X,Y>>					;; This command will click in some x,y position on your screen. You may need to use window spy to get the right cords. 
;; 		mousemove <<X,Y>>					;; This command will move to some x,y, position on your screen *it won't click*
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;*EDITABLE-D*;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


		TrayTip #1 Document Number, %field1% is about to be entered press enter to procede
		msgbox Check Document Number Entry  %field1%   
		Send %field1%                     
		send {TAB}

		TrayTip #2, %field2% is about to be entered press enter to procede
		Send %field2%  
		msgbox Check Entry                         
		send {TAB}
	
		TrayTip #3, %field3% is about to be entered press enter to procede
		Send %field3%  
		msgbox Check Entry                         
		send {TAB}
	
 		TrayTip #4, %field4% is about to be entered press enter to procede
		Send %field4%  
		msgbox Check Entry                         
		send {TAB}

 		TrayTip #5, %field5% is about to be entered press enter to procede
		Send %field5%  
		msgbox Check Entry                         
		send {TAB}

 		TrayTip #6, %field6% is about to be entered press enter to procede
		Send %field6%  
		msgbox Check Entry                         
		send {ENTER} 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;*EDITABLE-D*;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;          
;;////////////////////////////////////////////////////////////////////////////////////////////////////
;;////////////////////////////////////////////////////////////////////////////////////////////////////
;;////////////////////////////////////////////////////////////////////////////////////////////////////     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             *Instructions - F* 
;;                           ==Output data == 
;;     Each loop can use the FileAppend command to put 
;;      Var data into a file to describe what has been entered 
;;     thus far.
;;     Format is as follows
;;    FileAppend, <<TEXT>> <<%field<<<X>>>%  `n, C:\location where files should go\filename.txt
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;*EDITABLE-F*;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
		FileAppend, %field1%	%field2%	%field3%	%field4%	%field5%	%field6%	%field7%	%field8%	%field9%	%field10%	%field11%	%field12% %field13% %field14% %field15% %field16%`n, C:\Users\jhisson\Desktop\DataOUT.txt
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;*EDITABLE-F*;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;;////////////////////////////////////////////////////////////////////////////////////////////////////
;;////////////////////////////////////////////////////////////////////////////////////////////////////
;;////////////////////////////////////////////////////////////////////////////////////////////////////
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   IGNORE THESE FIELDS THEY NEED NOT CHANGE     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	}
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   IGNORE THESE FIELDS THEY NEED NOT CHANGE     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CTRL + P WILL PAUSE THE SCRIPT                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
^p::Pause
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CTRL + P WILL PAUSE THE SCRIPT                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
