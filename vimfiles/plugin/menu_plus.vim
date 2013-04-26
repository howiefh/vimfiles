" ---------------------------------------------------------------------            
" Sketch Menu Support: {{{1    
" ---------------------------------------------------------------------                                                     
if has("gui_running") && has("menu") && &go =~ 'm'                                 
 if !exists("g:SketchTopLvlMenu")                                                  
  let g:SketchTopLvlMenu= "Plugin."                                                
 endif                                                                             
 exe 'menu '.g:SketchTopLvlMenu.'Sketch.Start\ Sketch<Tab>:Sketch		 :call ToggleSketch()<CR>'   
endif                                                                              
" 
"
" " ---------------------------------------------------------------------            
" calendear Menu Support: {{{1    
" ---------------------------------------------------------------------                                                     
if has("gui_running") && has("menu") && &go =~ 'm'                                 
 if !exists("g:CalendarTopLvlMenu")                                                  
  let g:CalendarTopLvlMenu= "Plugin."                                                
 endif                                                                             
 exe 'menu '.g:CalendarTopLvlMenu.'Calendar<tab>:Calendar		 :Calendar<CR>'
endif


" ---------------------------------------------------------------------            
" winmanager Menu Support: {{{1    
" ---------------------------------------------------------------------                                                     
if has("gui_running") && has("menu") && &go =~ 'm'                                 
 if !exists("g:WMTopLvlMenu")                                                  
  let g:WMTopLvlMenu= "Plugin.WinMessage."                                                
 endif                                                                             
 exe 'menu '.g:WMTopLvlMenu.'Open<tab>:WMToggle		 :WMToggle<CR>'
 exe 'menu '.g:WMTopLvlMenu.'Close<tab>::WMClose		 :WMClose<CR>' 
endif




" ---------------------------------------------------------------------            
" txtbrowser Menu Support: {{{1    
" ---------------------------------------------------------------------                                                     
if has("gui_running") && has("menu") && &go =~ 'm'                                 
 if !exists("g:TxtBrowserTopLvlMenu")                                                  
  let g:TxtBrowserTopLvlMenu= "Plugin.TxtBrowser."                                                
 endif                                                                             
 exe 'menu '.g:TxtBrowserTopLvlMenu.'Tlist<tab>:Tlist		 :Tlist<CR>'  
 exe 'menu '.g:TxtBrowserTopLvlMenu.'TlistUpdate<tab>:TlistUpdate		 :TlistUpdate<CR>'    
 exe 'menu '.g:TxtBrowserTopLvlMenu.'TxtbrowserUrl<tab>:TGoto		 :TGoto <CR>'    
 exe 'menu '.g:TxtBrowserTopLvlMenu.'TxtbrowserWord<tab>:TFind		 :TFind<CR>'    
	exe 'menu '.g:TxtBrowserTopLvlMenu.'TxtbrowserSearch<tab>:TSearch		 :TSearch<CR>' 
endif  



