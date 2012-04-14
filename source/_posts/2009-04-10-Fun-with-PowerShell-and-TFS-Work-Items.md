---
layout: post
title: "Fun with PowerShell and TFS Work Items"
comments: false
date: 2009-04-10 12:53:23
updated: 2009-04-10 12:53:55
categories:
 - Technology
 - Agile Software Development
tags:
 - agile planning
 - vsts
 - powershell
subtext-id: 7f9b2184-d0f1-47ee-993d-0375e3641779
alias: /blog/Fun-with-PowerShell-and-TFS-Work-Items.aspx
---


It all started with me wanting a better burndown chart for my team. That was relatively simple to solve as we've got some pretty good ones floating around inside Microsoft. (Apologies in advance but I can't share my spreadsheet with you at this time.)

Then came the fun... I wanted to be able to pull any given day's "work done" and "work remaining" data. But for my own reasons, I don't want this spreadsheet bound to the OLAP cube, I want to be able to mess with it.

Being the PowerShell junkie that I am I was pretty sure I could do this. I found [James Manning's killer "get-tfs.ps1" script](http://blogs.msdn.com/jmanning/archive/2006/09/28/776141.aspx) which meant I didn't have to work out that bit myself.

Using it is simple:
    
       1: $tfs = get-tfs http://mytfs:8080
    
       2: $wi = $tfs.wit.GetWorkItem(12345)

As you can see, I get the TFS client object via James's script, and then I pull a WorkItem from it. From there I can ask the $wi object for all the bits of information in the work item. Piping it to get-member showed me the following methods and properties:
    
       1:┬á 
    
       2:    TypeName: Microsoft.TeamFoundation.WorkItemTracking.Client.WorkItem
    
       3:┬á 
    
       4: Name                   MemberType            Definition                                                                
    
       5: ----                   ----------            ----------                                                                
    
       6: FieldChanged           Event                 Microsoft.TeamFoundation.WorkItemTracking.Client.WorkItemFieldChangeEve...
    
       7: Copy                   Method                Microsoft.TeamFoundation.WorkItemTracking.Client.WorkItem Copy(Microsof...
    
       8: Equals                 Method                bool Equals(System.Object obj)                                            
    
       9: GetHashCode            Method                int GetHashCode()                                                         
    
      10: GetNextState           Method                string GetNextState(string action)                                        
    
      11: GetType                Method                type GetType()                                                            
    
      12: IsValid                Method                bool IsValid()                                                            
    
      13: MergeToLatest          Method                System.Void MergeToLatest()                                               
    
      14: Open                   Method                System.Void Open()                                                        
    
      15: PartialOpen            Method                System.Void PartialOpen()                                                 
    
      16: Reset                  Method                System.Void Reset()                                                       
    
      17: Save                   Method                System.Void Save()                                                        
    
      18: SyncToLatest           Method                System.Void SyncToLatest()                                                
    
      19: ToString               Method                string ToString()                                                         
    
      20: Validate               Method                System.Collections.ArrayList Validate()                                   
    
      21: Item                   ParameterizedProperty System.Object Item(string name) {get;set;}, System.Object Item(Microsof...
    
      22: AreaId                 Property              System.Int32 AreaId {get;set;}                                            
    
      23: AreaPath               Property              System.String AreaPath {get;set;}                                         
    
      24: AttachedFileCount      Property              System.Int32 AttachedFileCount {get;}                                     
    
      25: Attachments            Property              Microsoft.TeamFoundation.WorkItemTracking.Client.AttachmentCollection A...
    
      26: ChangedBy              Property              System.String ChangedBy {get;}                                            
    
      27: ChangedDate            Property              System.DateTime ChangedDate {get;}                                        
    
      28: CreatedBy              Property              System.String CreatedBy {get;}                                            
    
      29: CreatedDate            Property              System.DateTime CreatedDate {get;}                                        
    
      30: Description            Property              System.String Description {get;set;}                                      
    
      31: DisplayForm            Property              System.String DisplayForm {get;}                                          
    
      32: ExternalLinkCount      Property              System.Int32 ExternalLinkCount {get;}                                     
    
      33: Fields                 Property              Microsoft.TeamFoundation.WorkItemTracking.Client.FieldCollection Fields...
    
      34: History                Property              System.String History {get;set;}                                          
    
      35: HyperLinkCount         Property              System.Int32 HyperLinkCount {get;}                                        
    
      36: Id                     Property              System.Int32 Id {get;}                                                    
    
      37: IsDirty                Property              System.Boolean IsDirty {get;}                                             
    
      38: IsNew                  Property              System.Boolean IsNew {get;}                                               
    
      39: IsOpen                 Property              System.Boolean IsOpen {get;}                                              
    
      40: IsPartialOpen          Property              System.Boolean IsPartialOpen {get;}                                       
    
      41: IsReadOnly             Property              System.Boolean IsReadOnly {get;}                                          
    
      42: IsReadOnlyOpen         Property              System.Boolean IsReadOnlyOpen {get;}                                      
    
      43: IterationId            Property              System.Int32 IterationId {get;set;}                                       
    
      44: IterationPath          Property              System.String IterationPath {get;set;}                                    
    
      45: Links                  Property              Microsoft.TeamFoundation.WorkItemTracking.Client.LinkCollection Links {...
    
      46: NodeName               Property              System.String NodeName {get;}                                             
    
      47: Project                Property              Microsoft.TeamFoundation.WorkItemTracking.Client.Project Project {get;}   
    
      48: Reason                 Property              System.String Reason {get;set;}                                           
    
      49: RelatedLinkCount       Property              System.Int32 RelatedLinkCount {get;}                                      
    
      50: Rev                    Property              System.Int32 Rev {get;}                                                   
    
      51: RevisedDate            Property              System.DateTime RevisedDate {get;}                                        
    
      52: Revision               Property              System.Int32 Revision {get;}                                              
    
      53: Revisions              Property              Microsoft.TeamFoundation.WorkItemTracking.Client.RevisionCollection Rev...
    
      54: State                  Property              System.String State {get;set;}                                            
    
      55: Store                  Property              Microsoft.TeamFoundation.WorkItemTracking.Client.WorkItemStore Store {g...
    
      56: TemporaryId            Property              System.Int32 TemporaryId {get;}                                           
    
      57: Title                  Property              System.String Title {get;set;}                                            
    
      58: Type                   Property              Microsoft.TeamFoundation.WorkItemTracking.Client.WorkItemType Type {get;} 
    
      59: Uri                    Property              System.Uri Uri {get;}                                                     
    
      60: WorkItemLinkHistory    Property              Microsoft.TeamFoundation.WorkItemTracking.Client.WorkItemLinkCollection...
    
      61: WorkItemLinks          Property              Microsoft.TeamFoundation.WorkItemTracking.Client.WorkItemLinkCollection...
    
      62: GetCompletedWorkByDate ScriptMethod          System.Object GetCompletedWorkByDate();                                   
    
      63: GetRemainingWorkByDate ScriptMethod          System.Object GetRemainingWorkByDate();                                   

Lots of great stuff there, but what I really wanted was the work done _on any given day_ and not the current work remaining. Hmmm...

After digging around in the object model (with PowerShell of course), I found the answer. The Revisions collection contains the full history of the Work Item. If I enumerated that, looking at the dates, I should be able to get what I want.

A little while later I had it all worked out, setup as a type extension in PowerShell so it automatically works with every WorkItem type I get. Type extensions are added via a special XML file (more info). Here's what I added to mine:
    
       1: <Type>
    
       2:     <Name>Microsoft.TeamFoundation.WorkItemTracking.Client.WorkItem</Name>
    
       3:     <Members>
    
       4:         <ScriptMethod>
    
       5:             <Name>GetCompletedWorkByDate</Name>
    
       6:             <Script>
    
       1:┬á 
    
       2:                 $date = [datetime] $args[0]
    
       3:                 $total = 0
    
       4:                 $this.Revisions | % {
    
       5:                     if ($_.Fields['Changed Date'].Value.Date -eq $date) {
    
       6:                         $work = $_.Fields["Completed Work"]
    
       7:                         if ($work -ne $null) { $total += ([int] $work.Value) - ([int] $work.OriginalValue) }
    
       8:                     }
    
       9:                 }
    
      10:                 return $total
    
      11:             

</Script>
    
       7:         </ScriptMethod>
    
       8:         <ScriptMethod>
    
       9:             <Name>GetRemainingWorkByDate</Name>
    
      10:             <Script>
    
       1:┬á 
    
       2:                 $date = [datetime] $args[0]
    
       3:                 $total = 0
    
       4:                 $this.Revisions | % {
    
       5:                     if ($_.Fields['Changed Date'].Value.Date -le $date) {
    
       6:                         $work = $_.Fields["Remaining Work"]
    
       7:                         if ($work -ne $null) {
    
       8:                             $total = ([int] $work.Value)
    
       9:                         }
    
      10:                     }
    
      11:                 }
    
      12:                 return $total
    
      13:             

</Script>
    
      11:         </ScriptMethod>
    
      12:     </Members>
    
      13: </Type>

What this does is add two new methods to the .NET type Microsoft.TeamFoundation.WorkItemTracking.Client.Workitem. The first method takes a date and returns the sum of the "Completed Work" field for all revisions that occurred on that date. The second method enumerates the same Revisions collection, but this time it process all revisions up through the given date looking for the last one that says anything about the "Remaining Work" field.

Next step... create a script to wrap all this up into an easy to use command I call get-burndowndata.ps1:
    
       1: param( 
    
       2:         $deliverable = $(throw "Must provide deliverable ID"),
    
       3:         $date = [datetime]::Now.Date 
    
       4: )
    
       5:┬á 
    
       6: $tfs = get-tfs [http://mytfs:8080](http://mytfs:8080)
    
       7: $deliverable = $tfs.WIT.GetWorkItem($deliverable) 
    
       8:┬á 
    
       9: $result = @()
    
      10:┬á 
    
      11: $deliverable.WorkItemLinks | ? { $_.LinkType.Name -eq "Child" } | % {
    
      12:     $feature = $tfs.WIT.GetWorkItem($_.TargetId)
    
      13:┬á 
    
      14:     $feature.WorkItemLinks | ? { $_.LinkType.Name -eq "Child" } | % {
    
      15:         $task = $tfs.WIT.GetWorkItem($_.TargetId)
    
      16:         $completed = $task.GetCompletedWorkByDate($date)
    
      17:         $remaining = $task.GetRemainingWorkByDate($date)
    
      18:┬á 
    
      19:         $obj = "" | select-object ID, Title, Completed, Remaining 
    
      20:         $obj.ID = $task.ID
    
      21:         $obj.Title = $task.Title
    
      22:         $obj.Completed = $completed
    
      23:         $obj.Remaining = $remaining
    
      24:┬á 
    
      25:         $result += $obj
    
      26:     }
    
      27: }
    
      28:┬á 
    
      29: $result

Now, getting any given day's burndown information is as simple as calling that script and opening the result in Excel:
    
       1: get-burndowndata.ps1 12345 "4/1/2009" | export-csv data_20090401.csv
    
       2: invoke-item data_20090401.csv

Works like a charm!

_**Disclaimer: **The get-burndowndata.ps1 script makes lots of assumptions about your TFS Work Item struction and relationships . It probably won't work unmodified for anyone outside of DevDiv._
