[33mcommit a2aa1d72f072d22c713c6e928a60e8253b31af4a[m
Author: Alex Baranov <a.b320012@gmail.com>
Date:   Wed Nov 7 14:41:55 2018 -0500

    fixing issues
    
    
    Former-commit-id: 214c132a754a54c823c16fb745b1f85194b59906
    Former-commit-id: 3ece0368bab79914ab5d596a015b0bc2510cf81f

[1mdiff --git a/app/views/study/instruments/_silcton_free_exploration.html.erb b/app/views/study/instruments/_silcton_free_exploration.html.erb[m
[1mindex fac9255..5f8d6c6 100644[m
[1m--- a/app/views/study/instruments/_silcton_free_exploration.html.erb[m
[1m+++ b/app/views/study/instruments/_silcton_free_exploration.html.erb[m
[36m@@ -4,8 +4,6 @@[m
 <script src="/free-exploration/Build/UnityLoader.js"></script>[m
 <% end%>[m
 [m
[31m-<script src="/assets/UnityObject2.js"></script>[m
[31m-[m
 <script type="text/javascript">[m
 [m
 [m

[33mcommit 0a2fe0b5d92f9b2838ac005b9397609a7764e494[m
Author: Alex Baranov <a.b320012@gmail.com>
Date:   Wed Nov 7 13:42:48 2018 -0500

    added new unity projects
    
    
    Former-commit-id: 63486f1737f24e41e0883ffcd11a7771f163edfc
    Former-commit-id: 7ab954aed61072abd323b7f6ad1d24a45591432a

[1mdiff --git a/app/views/study/instruments/_silcton_free_exploration.html.erb b/app/views/study/instruments/_silcton_free_exploration.html.erb[m
[1mindex 5f17992..fac9255 100644[m
[1m--- a/app/views/study/instruments/_silcton_free_exploration.html.erb[m
[1m+++ b/app/views/study/instruments/_silcton_free_exploration.html.erb[m
[36m@@ -1,23 +1,33 @@[m
[31m-<% unity_file = "/unity/silcton_free_exploration.unity3d" %>[m
[32m+[m[32m<%= content_for :head  do %>[m
[32m+[m
[32m+[m[32m<script src="/free-exploration/TemplateData/UnityProgress.js"></script>[m[41m  [m
[32m+[m[32m<script src="/free-exploration/Build/UnityLoader.js"></script>[m
[32m+[m[32m<% end%>[m
 [m
 <script src="/assets/UnityObject2.js"></script>[m
 [m
 <script type="text/javascript">[m
[31m-  var u = new UnityObject2();[m
 [m
[32m+[m
[32m+[m[32m  var gameInstance[m
[32m+[m[32m  $( document ).on('turbolinks:load',function(){ gameInstance = UnityLoader.instantiate("gameContainer", "/free-exploration/Build/Silcton_FreeExploration_Website.json", {onProgress: UnityProgress}); })[m
   function recordPositionLine(positionString) {[m
     $log = $("#virtual_navigation_log");[m
     var previousLog = $log.val();[m
     $log.val(previousLog + "\n" + positionString)[m
   }[m
[31m-[m
[31m-  $(document).ready(function() {[m
[31m-    u.initPlugin($("#unity-embed")[0], "<%= unity_file %>");[m
[31m-  });[m
 </script>[m
 [m
[32m+[m[32m    <div class="webgl-content">[m
[32m+[m[32m      <div id="gameContainer" style="width: 1024px; height: 768px"></div>[m
[32m+[m[32m      <div class="footer">[m
[32m+[m[32m        <div class="webgl-logo"></div>[m
[32m+[m[32m        <div class="fullscreen" onclick="gameInstance.SetFullscreen(1)"></div>[m
[32m+[m[32m        <div class="title">Virtual Silcton</div>[m
[32m+[m[32m      </div>[m
[32m+[m[32m    </div>[m
 <%= form_tag study_instrument_path(:study_id=>@study.id,:instrument_id=>@instrument.order) %>[m
[31m-<div id="unity-embed" style="width: 1024px; height: 768px; border: 1px black solid"></div>[m
[32m+[m
 <input type="hidden" name="virtual_navigation_log[log]" id="virtual_navigation_log" />[m
 <%= submit_tag 'I am Finished', :class => "button" %>[m
 </form>[m

[33mcommit 2b0fe2b1c10dafeba57c17c7948adb14c3471ef6[m
Author: A.B <a.b320012@gmail.com>
Date:   Tue Jul 24 11:36:29 2018 -0400

    rails upgrade
    
    
    Former-commit-id: cc24cdd687256c23bd011731f5af22250ba17113

[1mdiff --git a/app/views/study/instruments/_silcton_free_exploration.html.erb b/app/views/study/instruments/_silcton_free_exploration.html.erb[m
[1mnew file mode 100644[m
[1mindex 0000000..5f17992[m
[1m--- /dev/null[m
[1m+++ b/app/views/study/instruments/_silcton_free_exploration.html.erb[m
[36m@@ -0,0 +1,23 @@[m
[32m+[m[32m<% unity_file = "/unity/silcton_free_exploration.unity3d" %>[m
[32m+[m
[32m+[m[32m<script src="/assets/UnityObject2.js"></script>[m
[32m+[m
[32m+[m[32m<script type="text/javascript">[m
[32m+[m[32m  var u = new UnityObject2();[m
[32m+[m
[32m+[m[32m  function recordPositionLine(positionString) {[m
[32m+[m[32m    $log = $("#virtual_navigation_log");[m
[32m+[m[32m    var previousLog = $log.val();[m
[32m+[m[32m    $log.val(previousLog + "\n" + positionString)[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  $(document).ready(function() {[m
[32m+[m[32m    u.initPlugin($("#unity-embed")[0], "<%= unity_file %>");[m
[32m+[m[32m  });[m
[32m+[m[32m</script>[m
[32m+[m
[32m+[m[32m<%= form_tag study_instrument_path(:study_id=>@study.id,:instrument_id=>@instrument.order) %>[m
[32m+[m[32m<div id="unity-embed" style="width: 1024px; height: 768px; border: 1px black solid"></div>[m
[32m+[m[32m<input type="hidden" name="virtual_navigation_log[log]" id="virtual_navigation_log" />[m
[32m+[m[32m<%= submit_tag 'I am Finished', :class => "button" %>[m
[32m+[m[32m</form>[m
