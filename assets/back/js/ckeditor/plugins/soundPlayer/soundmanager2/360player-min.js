﻿/**
 *
 * SoundManager 2 Demo: 360-degree / "donut player"
 * ------------------------------------------------
 * http://schillmania.com/projects/soundmanager2/
 *
*/
var threeSixtyPlayer,ThreeSixtyPlayer;!function(a){function t(){var t=this,e=this,n=soundManager,i=navigator.userAgent,s=i.match(/msie/i),o=i.match(/opera/i),d=i.match(/safari/i),r=i.match(/chrome/i),l=(i.match(/firefox/i),i.match(/ipad|iphone/i)),u="undefined"==typeof a.G_vmlCanvasManager&&"undefined"!=typeof document.createElement("canvas").getContext("2d"),c=o||r?359.9:360,m=navigator.userAgent.match(/msie [678]/i)?1:2;this.excludeClass="threesixty-exclude",this.links=[],this.sounds=[],this.soundsByURL=[],this.indexByURL=[],this.lastSound=null,this.lastTouchedSound=null,this.soundCount=0,this.oUITemplate=null,this.oUIImageMap=null,this.vuMeter=null,this.callbackCount=0,this.peakDataHistory=[],this.config={playNext:!1,autoPlay:!1,allowMultiple:!1,loadRingColor:"#ccc",playRingColor:"#000",backgroundRingColor:"#eee",segmentRingColor:"rgba(255,255,255,0.33)",segmentRingColorAlt:"rgba(0,0,0,0.1)",loadRingColorMetadata:"#ddd",playRingColorMetadata:"rgba(128,192,256,0.9)",circleDiameter:null,circleRadius:null,animDuration:500,animTransition:a.Animator.tx.bouncy,showHMSTime:!1,scaleFont:!0,useWaveformData:!1,waveformDataColor:"#0099ff",waveformDataDownsample:3,waveformDataOutside:!1,waveformDataConstrain:!1,waveformDataLineRatio:.64,useEQData:!1,eqDataColor:"#339933",eqDataDownsample:4,eqDataOutside:!0,eqDataLineRatio:.54,usePeakData:!0,peakDataColor:"#ff33ff",peakDataOutside:!0,peakDataLineRatio:.5,useAmplifier:!0,fontSizeMax:null,scaleArcWidth:1,useFavIcon:!1},this.css={sDefault:"sm2_link",sBuffering:"sm2_buffering",sPlaying:"sm2_playing",sPaused:"sm2_paused"},this.addEventHandler="undefined"!=typeof a.addEventListener?function(a,t,e){return a.addEventListener(t,e,!1)}:function(a,t,e){a.attachEvent("on"+t,e)},this.removeEventHandler="undefined"!=typeof a.removeEventListener?function(a,t,e){return a.removeEventListener(t,e,!1)}:function(a,t,e){return a.detachEvent("on"+t,e)},this.hasClass=function(a,t){return"undefined"!=typeof a.className?a.className.match(new RegExp("(\\s|^)"+t+"(\\s|$)")):!1},this.addClass=function(a,e){return a&&e&&!t.hasClass(a,e)?void(a.className=(a.className?a.className+" ":"")+e):!1},this.removeClass=function(a,e){return a&&e&&t.hasClass(a,e)?void(a.className=a.className.replace(new RegExp("( "+e+")|("+e+")","g"),"")):!1},this.getElementsByClassName=function(a,e,n){var i,s,o=n||document,d=[],r=[];if("undefined"!=typeof e&&"string"!=typeof e)for(i=e.length;i--;)r&&r[e[i]]||(r[e[i]]=o.getElementsByTagName(e[i]));else r=e?o.getElementsByTagName(e):o.all||o.getElementsByTagName("*");if("string"!=typeof e)for(i=e.length;i--;)for(s=r[e[i]].length;s--;)t.hasClass(r[e[i]][s],a)&&d.push(r[e[i]][s]);else for(i=0;i<r.length;i++)t.hasClass(r[i],a)&&d.push(r[i]);return d},this.getParentByNodeName=function(a,t){if(!a||!t)return!1;for(t=t.toLowerCase();a.parentNode&&t!==a.parentNode.nodeName.toLowerCase();)a=a.parentNode;return a.parentNode&&t===a.parentNode.nodeName.toLowerCase()?a.parentNode:null},this.getParentByClassName=function(a,e){if(!a||!e)return!1;for(;a.parentNode&&!t.hasClass(a.parentNode,e);)a=a.parentNode;return a.parentNode&&t.hasClass(a.parentNode,e)?a.parentNode:null},this.getSoundByURL=function(a){return"undefined"!=typeof t.soundsByURL[a]?t.soundsByURL[a]:null},this.isChildOfNode=function(a,t){if(!a||!a.parentNode)return!1;t=t.toLowerCase();do a=a.parentNode;while(a&&a.parentNode&&a.nodeName.toLowerCase()!==t);return a&&a.nodeName.toLowerCase()===t?a:null},this.isChildOfClass=function(a,e){if(!a||!e)return!1;for(;a.parentNode&&!t.hasClass(a,e);)a=t.findParent(a);return t.hasClass(a,e)},this.findParent=function(a){if(!a||!a.parentNode)return!1;if(a=a.parentNode,2===a.nodeType)for(;a&&a.parentNode&&2===a.parentNode.nodeType;)a=a.parentNode;return a},this.getStyle=function(t,e){try{if(t.currentStyle)return t.currentStyle[e];if(a.getComputedStyle)return document.defaultView.getComputedStyle(t,null).getPropertyValue(e)}catch(n){}return null},this.findXY=function(a){var t=0,e=0;do t+=a.offsetLeft,e+=a.offsetTop;while(a=a.offsetParent);return[t,e]},this.getMouseXY=function(e){return e=e?e:a.event,l&&e.touches&&(e=e.touches[0]),e.pageX||e.pageY?[e.pageX,e.pageY]:e.clientX||e.clientY?[e.clientX+t.getScrollLeft(),e.clientY+t.getScrollTop()]:void 0},this.getScrollLeft=function(){return document.body.scrollLeft+document.documentElement.scrollLeft},this.getScrollTop=function(){return document.body.scrollTop+document.documentElement.scrollTop},this.events={play:function(){e.removeClass(this._360data.oUIBox,this._360data.className),this._360data.className=e.css.sPlaying,e.addClass(this._360data.oUIBox,this._360data.className),t.fanOut(this)},stop:function(){e.removeClass(this._360data.oUIBox,this._360data.className),this._360data.className="",t.fanIn(this)},pause:function(){e.removeClass(this._360data.oUIBox,this._360data.className),this._360data.className=e.css.sPaused,e.addClass(this._360data.oUIBox,this._360data.className)},resume:function(){e.removeClass(this._360data.oUIBox,this._360data.className),this._360data.className=e.css.sPlaying,e.addClass(this._360data.oUIBox,this._360data.className)},finish:function(){var a;e.removeClass(this._360data.oUIBox,this._360data.className),this._360data.className="",this._360data.didFinish=!0,t.fanIn(this),e.config.playNext&&(a=e.indexByURL[this._360data.oLink.href]+1,a<e.links.length&&e.handleClick({target:e.links[a]}))},whileloading:function(){this.paused&&t.updatePlaying.apply(this)},whileplaying:function(){t.updatePlaying.apply(this),this._360data.fps++},bufferchange:function(){this.isBuffering?e.addClass(this._360data.oUIBox,e.css.sBuffering):e.removeClass(this._360data.oUIBox,e.css.sBuffering)}},this.stopEvent=function(t){return"undefined"!=typeof t&&"undefined"!=typeof t.preventDefault?t.preventDefault():"undefined"!=typeof a.event&&"undefined"!=typeof a.event.returnValue&&(a.event.returnValue=!1),!1},this.getTheDamnLink=s?function(t){return t&&t.target?t.target:a.event.srcElement}:function(a){return a.target},this.handleClick=function(e){if(e.button>1)return!0;var i,s,o,d,r,l,u,c=t.getTheDamnLink(e);return("a"===c.nodeName.toLowerCase()||(c=t.isChildOfNode(c,"a")))&&t.isChildOfClass(c,"ui360")?(s=c.getAttribute("href"),c.href&&n.canPlayLink(c)&&!t.hasClass(c,t.excludeClass)?(n._writeDebug("handleClick()"),o=c.href,d=t.getSoundByURL(o),d?d===t.lastSound?d.togglePause():(d.togglePause(),n._writeDebug("sound different than last sound: "+t.lastSound.id),!t.config.allowMultiple&&t.lastSound&&t.stopSound(t.lastSound)):(r=c.parentNode,l=t.getElementsByClassName("ui360-vis","div",r.parentNode).length,d=n.createSound({id:"ui360Sound"+t.soundCount++,url:o,onplay:t.events.play,onstop:t.events.stop,onpause:t.events.pause,onresume:t.events.resume,onfinish:t.events.finish,onbufferchange:t.events.bufferchange,type:c.type||null,whileloading:t.events.whileloading,whileplaying:t.events.whileplaying,useWaveformData:l&&t.config.useWaveformData,useEQData:l&&t.config.useEQData,usePeakData:l&&t.config.usePeakData}),u=parseInt(t.getElementsByClassName("sm2-360ui","div",r)[0].offsetWidth*m,10),i=t.getElementsByClassName("sm2-canvas","canvas",r),d._360data={oUI360:t.getParentByClassName(c,"ui360"),oLink:c,className:t.css.sPlaying,oUIBox:t.getElementsByClassName("sm2-360ui","div",r)[0],oCanvas:i[i.length-1],oButton:t.getElementsByClassName("sm2-360btn","span",r)[0],oTiming:t.getElementsByClassName("sm2-timing","div",r)[0],oCover:t.getElementsByClassName("sm2-cover","div",r)[0],circleDiameter:u,circleRadius:u/2,lastTime:null,didFinish:null,pauseCount:0,radius:0,fontSize:1,fontSizeMax:t.config.fontSizeMax,scaleFont:l&&t.config.scaleFont,showHMSTime:l,amplifier:l&&t.config.usePeakData?.9:1,radiusMax:.175*u,width:0,widthMax:.4*u,lastValues:{bytesLoaded:0,bytesTotal:0,position:0,durationEstimate:0},animating:!1,oAnim:new a.Animator({duration:t.config.animDuration,transition:t.config.animTransition,onComplete:function(){}}),oAnimProgress:function(a){var e=this;e._360data.radius=parseInt(e._360data.radiusMax*e._360data.amplifier*a,10),e._360data.width=parseInt(e._360data.widthMax*e._360data.amplifier*a,10),e._360data.scaleFont&&null!==e._360data.fontSizeMax&&(e._360data.oTiming.style.fontSize=parseInt(Math.max(1,e._360data.fontSizeMax*a),10)+"px",e._360data.oTiming.style.opacity=a),(e.paused||0===e.playState||0===e._360data.lastValues.bytesLoaded||0===e._360data.lastValues.position)&&t.updatePlaying.apply(e)},fps:0},"undefined"!=typeof t.Metadata&&t.getElementsByClassName("metadata","div",d._360data.oUI360).length&&(d._360data.metadata=new t.Metadata(d,t)),d._360data.scaleFont&&null!==d._360data.fontSizeMax&&(d._360data.oTiming.style.fontSize="1px"),d._360data.oAnim.addSubject(d._360data.oAnimProgress,d),t.refreshCoords(d),t.updatePlaying.apply(d),t.soundsByURL[o]=d,t.sounds.push(d),!t.config.allowMultiple&&t.lastSound&&t.stopSound(t.lastSound),d.play()),t.lastSound=d,"undefined"!=typeof e&&"undefined"!=typeof e.preventDefault?e.preventDefault():"undefined"!=typeof a.event&&(a.event.returnValue=!1),!1):!0):!0},this.fanOut=function(e){var n=e;return 1===n._360data.animating?!1:(n._360data.animating=0,soundManager._writeDebug("fanOut: "+n.id+": "+n._360data.oLink.href),n._360data.oAnim.seekTo(1),void a.setTimeout(function(){n._360data.animating=0},t.config.animDuration+20))},this.fanIn=function(e){var n=e;return-1===n._360data.animating?!1:(n._360data.animating=-1,soundManager._writeDebug("fanIn: "+n.id+": "+n._360data.oLink.href),n._360data.oAnim.seekTo(0),void a.setTimeout(function(){n._360data.didFinish=!1,n._360data.animating=0,t.resetLastValues(n)},t.config.animDuration+20))},this.resetLastValues=function(a){a._360data.lastValues.position=0},this.refreshCoords=function(a){a._360data.canvasXY=t.findXY(a._360data.oCanvas),a._360data.canvasMid=[a._360data.circleRadius,a._360data.circleRadius],a._360data.canvasMidXY=[a._360data.canvasXY[0]+a._360data.canvasMid[0],a._360data.canvasXY[1]+a._360data.canvasMid[1]]},this.stopSound=function(a){soundManager._writeDebug("stopSound: "+a.id),soundManager.stop(a.id),l||soundManager.unload(a.id)},this.buttonClick=function(e){var n=e?e.target?e.target:e.srcElement:a.event.srcElement;return t.handleClick({target:t.getParentByClassName(n,"sm2-360ui").nextSibling}),!1},this.buttonMouseDown=function(a){return l?t.addEventHandler(document,"touchmove",t.mouseDown):document.onmousemove=function(a){t.mouseDown(a)},t.stopEvent(a),!1},this.mouseDown=function(e){if(!l&&e.button>1)return!0;if(!t.lastSound)return t.stopEvent(e),!1;var n,i,s,o=e?e:a.event;return l&&o.touches&&(o=o.touches[0]),n=o.target||o.srcElement,i=t.getSoundByURL(t.getElementsByClassName("sm2_link","a",t.getParentByClassName(n,"ui360"))[0].href),t.lastTouchedSound=i,t.refreshCoords(i),s=i._360data,t.addClass(s.oUIBox,"sm2_dragging"),s.pauseCount=t.lastTouchedSound.paused?1:0,t.mmh(e?e:a.event),l?(t.removeEventHandler(document,"touchmove",t.mouseDown),t.addEventHandler(document,"touchmove",t.mmh),t.addEventHandler(document,"touchend",t.mouseUp)):(document.onmousemove=t.mmh,document.onmouseup=t.mouseUp),t.stopEvent(e),!1},this.mouseUp=function(a){var e=t.lastTouchedSound._360data;t.removeClass(e.oUIBox,"sm2_dragging"),0===e.pauseCount&&t.lastTouchedSound.resume(),l?(t.removeEventHandler(document,"touchmove",t.mmh),t.removeEventHandler(document,"touchend",t.mouseUP)):(document.onmousemove=null,document.onmouseup=null)},this.mmh=function(e){"undefined"==typeof e&&(e=a.event);var n=t.lastTouchedSound,i=t.getMouseXY(e),s=i[0],o=i[1],d=s-n._360data.canvasMidXY[0],r=o-n._360data.canvasMidXY[1],l=Math.floor(c-(t.rad2deg(Math.atan2(d,r))+180));return n.setPosition(n.durationEstimate*(l/c)),t.stopEvent(e),!1},this.drawSolidArc=function(a,e,n,i,s,r,l){var u,c,m,f,h=a;h.getContext&&(u=h.getContext("2d")),a=u,l||t.clearCanvas(h),e&&(u.fillStyle=e),a.beginPath(),isNaN(s)&&(s=0),c=n-i,m=o||d,(!m||m&&n>0)&&(a.arc(0,0,n,r,s,!1),f=t.getArcEndpointCoords(c,s),a.lineTo(f.x,f.y),a.arc(0,0,c,s,r,!0),a.closePath(),a.fill())},this.getArcEndpointCoords=function(a,t){return{x:a*Math.cos(t),y:a*Math.sin(t)}},this.deg2rad=function(a){return a*Math.PI/180},this.rad2deg=function(a){return 180*a/Math.PI},this.getTime=function(a,t){var e=Math.floor(a/1e3),n=Math.floor(e/60),i=e-60*n;return t?n+":"+(10>i?"0"+i:i):{min:n,sec:i}},this.clearCanvas=function(a){var t,e,n=a,i=null;n.getContext&&(i=n.getContext("2d")),i&&(t=n.offsetWidth,e=n.offsetHeight,i.clearRect(-(t/2),-(e/2),t,e))},this.updatePlaying=function(){var a=this._360data.showHMSTime?t.getTime(this.position,!0):parseInt(this.position/1e3,10),e=t.config.scaleArcWidth;this.bytesLoaded&&(this._360data.lastValues.bytesLoaded=this.bytesLoaded,this._360data.lastValues.bytesTotal=this.bytesTotal),this.position&&(this._360data.lastValues.position=this.position),this.durationEstimate&&(this._360data.lastValues.durationEstimate=this.durationEstimate),t.drawSolidArc(this._360data.oCanvas,t.config.backgroundRingColor,this._360data.width,this._360data.radius*e,t.deg2rad(c),!1),t.drawSolidArc(this._360data.oCanvas,this._360data.metadata?t.config.loadRingColorMetadata:t.config.loadRingColor,this._360data.width,this._360data.radius*e,t.deg2rad(c*(this._360data.lastValues.bytesLoaded/this._360data.lastValues.bytesTotal)),0,!0),0!==this._360data.lastValues.position&&t.drawSolidArc(this._360data.oCanvas,this._360data.metadata?t.config.playRingColorMetadata:t.config.playRingColor,this._360data.width,this._360data.radius*e,t.deg2rad(1===this._360data.didFinish?c:c*(this._360data.lastValues.position/this._360data.lastValues.durationEstimate)),0,!0),this._360data.metadata&&this._360data.metadata.events.whileplaying(),a!==this._360data.lastTime&&(this._360data.lastTime=a,this._360data.oTiming.innerHTML=a),(this.instanceOptions.useWaveformData||this.instanceOptions.useEQData)&&u&&t.updateWaveform(this),t.config.useFavIcon&&t.vuMeter&&t.vuMeter.updateVU(this)},this.updateWaveform=function(a){if(!t.config.useWaveformData&&!t.config.useEQData||!n.features.waveformData&&!n.features.eqData)return!1;if(!a.waveformData.left.length&&!a.eqData.length&&!a.peakData.left)return!1;var e,i,s,o,d,r,l,u,c,m,f,h,g,p,v,y,_=(a._360data.oCanvas.getContext("2d"),parseInt(a._360data.circleDiameter/2,10)),C=_/2;if(t.config.useWaveformData)for(o=t.config.waveformDataDownsample,o=Math.max(1,o),d=256,r=d/o,l=0,u=0,c=null,m=t.config.waveformDataOutside?1:t.config.waveformDataConstrain?.5:.565,C=t.config.waveformDataOutside?.7:.75,f=t.deg2rad(360/r*t.config.waveformDataLineRatio),e=0;d>e;e+=o)l=t.deg2rad(360*(e/r*1/o)),u=l+f,c=a.waveformData.left[e],0>c&&t.config.waveformDataConstrain&&(c=Math.abs(c)),t.drawSolidArc(a._360data.oCanvas,t.config.waveformDataColor,a._360data.width*m*(2-t.config.scaleArcWidth),a._360data.radius*C*1.25*c,u,l,!0);if(t.config.useEQData)for(o=t.config.eqDataDownsample,h=0,o=Math.max(1,o),g=192,r=g/o,m=t.config.eqDataOutside?1:.565,s=t.config.eqDataOutside?-1:1,C=t.config.eqDataOutside?.5:.75,l=0,u=0,f=t.deg2rad(360/r*t.config.eqDataLineRatio),p=t.deg2rad(1===a._360data.didFinish?360:360*(a._360data.lastValues.position/a._360data.lastValues.durationEstimate)),i=0,v=0,e=0;g>e;e+=o)l=t.deg2rad(360*(e/g)),u=l+f,t.drawSolidArc(a._360data.oCanvas,u>p?t.config.eqDataColor:t.config.playRingColor,a._360data.width*m,a._360data.radius*C*(a.eqData.left[e]*s),u,l,!0);if(t.config.usePeakData&&!a._360data.animating){for(y=a.peakData.left||a.peakData.right,g=3,e=0;g>e;e++)y=y||a.eqData[e];a._360data.amplifier=t.config.useAmplifier?.9+.1*y:1,a._360data.radiusMax=.175*a._360data.circleDiameter*a._360data.amplifier,a._360data.widthMax=.4*a._360data.circleDiameter*a._360data.amplifier,a._360data.radius=parseInt(a._360data.radiusMax*a._360data.amplifier,10),a._360data.width=parseInt(a._360data.widthMax*a._360data.amplifier,10)}},this.getUIHTML=function(a){return['<canvas class="sm2-canvas" width="'+a+'" height="'+a+'"></canvas>',' <span class="sm2-360btn sm2-360btn-default"></span>',' <div class="sm2-timing'+(navigator.userAgent.match(/safari/i)?" alignTweak":"")+'"></div>',' <div class="sm2-cover"></div>']},this.uiTest=function(a){var e,n,i,s,o,d,r,l,u,c=document.createElement("div");return c.className="sm2-360ui",e=document.createElement("div"),e.className="ui360"+(a?" "+a:""),n=e.appendChild(c.cloneNode(!0)),e.style.position="absolute",e.style.left="-9999px",i=document.body.appendChild(e),s=n.offsetWidth*m,o=t.getUIHTML(s),n.innerHTML=o[1]+o[2]+o[3],d=parseInt(s,10),r=parseInt(d/2,10),u=t.getElementsByClassName("sm2-timing","div",i)[0],l=parseInt(t.getStyle(u,"font-size"),10),isNaN(l)&&(l=null),e.parentNode.removeChild(e),o=e=n=i=null,{circleDiameter:d,circleRadius:r,fontSizeMax:l}},this.init=function(){n._writeDebug("threeSixtyPlayer.init()");var e,i,o,d,r,u,c,f,h,g,p,v,y,_,C,D=t.getElementsByClassName("ui360","div"),M=[],N=!1,T=0;for(e=0,i=D.length;i>e;e++)M.push(D[e].getElementsByTagName("a")[0]),D[e].style.backgroundImage="none";for(t.oUITemplate=document.createElement("div"),t.oUITemplate.className="sm2-360ui",t.oUITemplateVis=document.createElement("div"),t.oUITemplateVis.className="sm2-360ui",h=t.uiTest(),t.config.circleDiameter=h.circleDiameter,t.config.circleRadius=h.circleRadius,g=t.uiTest("ui360-vis"),t.config.fontSizeMax=g.fontSizeMax,t.oUITemplate.innerHTML=t.getUIHTML(t.config.circleDiameter).join(""),t.oUITemplateVis.innerHTML=t.getUIHTML(g.circleDiameter).join(""),e=0,i=M.length;i>e;e++)!n.canPlayLink(M[e])||t.hasClass(M[e],t.excludeClass)||t.hasClass(M[e],t.css.sDefault)||(t.addClass(M[e],t.css.sDefault),t.links[T]=M[e],t.indexByURL[M[e].href]=T,T++,N=t.hasClass(M[e].parentNode,"ui360-vis"),c=(N?g:h).circleDiameter,f=(N?g:h).circleRadius,p=M[e].parentNode.insertBefore((N?t.oUITemplateVis:t.oUITemplate).cloneNode(!0),M[e]),s&&"undefined"!=typeof a.G_vmlCanvasManager?(y=M[e].parentNode,_=document.createElement("canvas"),_.className="sm2-canvas",C="sm2_canvas_"+e+(new Date).getTime(),_.id=C,_.width=c,_.height=c,p.appendChild(_),a.G_vmlCanvasManager.initElement(_),d=document.getElementById(C),o=d.parentNode.getElementsByTagName("canvas"),o.length>1&&(d=o[o.length-1])):d=M[e].parentNode.getElementsByTagName("canvas")[0],m>1&&t.addClass(d,"hi-dpi"),u=t.getElementsByClassName("sm2-cover","div",M[e].parentNode)[0],v=M[e].parentNode.getElementsByTagName("span")[0],t.addEventHandler(v,"click",t.buttonClick),l?t.addEventHandler(u,"touchstart",t.mouseDown):t.addEventHandler(u,"mousedown",t.mouseDown),r=d.getContext("2d"),r.translate(f,f),r.rotate(t.deg2rad(-90)));T>0&&(t.addEventHandler(document,"click",t.handleClick),t.config.autoPlay&&t.handleClick({target:t.links[0],preventDefault:function(){}})),n._writeDebug("threeSixtyPlayer.init(): Found "+T+" relevant items."),t.config.useFavIcon&&"undefined"!=typeof this.VUMeter&&(this.vuMeter=new this.VUMeter(this))}}t.prototype.VUMeter=function(a){var t=a,e=this,n=document.getElementsByTagName("head")[0],i=navigator.userAgent.match(/opera/i),s=navigator.userAgent.match(/firefox/i);this.vuMeterData=[],this.vuDataCanvas=null,this.setPageIcon=function(a){if(!t.config.useFavIcon||!t.config.usePeakData||!a)return!1;var e=document.getElementById("sm2-favicon");e&&(n.removeChild(e),e=null),e||(e=document.createElement("link"),e.id="sm2-favicon",e.rel="shortcut icon",e.type="image/png",e.href=a,document.getElementsByTagName("head")[0].appendChild(e))},this.resetPageIcon=function(){if(!t.config.useFavIcon)return!1;var a=document.getElementById("favicon");a&&(a.href="/favicon.ico")},this.updateVU=function(a){soundManager.flashVersion>=9&&t.config.useFavIcon&&t.config.usePeakData&&e.setPageIcon(e.vuMeterData[parseInt(16*a.peakData.left,10)][parseInt(16*a.peakData.right,10)])},this.createVUData=function(){var a=0,t=0,n=e.vuDataCanvas.getContext("2d"),i=n.createLinearGradient(0,16,0,0),s=n.createLinearGradient(0,16,0,0),o="rgba(0,0,0,0.2)";for(i.addColorStop(0,"rgb(0,192,0)"),i.addColorStop(.3,"rgb(0,255,0)"),i.addColorStop(.625,"rgb(255,255,0)"),i.addColorStop(.85,"rgb(255,0,0)"),s.addColorStop(0,o),s.addColorStop(1,"rgba(0,0,0,0.5)"),a=0;16>a;a++)e.vuMeterData[a]=[];for(a=0;16>a;a++)for(t=0;16>t;t++)e.vuDataCanvas.setAttribute("width",16),e.vuDataCanvas.setAttribute("height",16),n.fillStyle=s,n.fillRect(0,0,7,15),n.fillRect(8,0,7,15),n.fillStyle=i,n.fillRect(0,15-a,7,16-(16-a)),n.fillRect(8,15-t,7,16-(16-t)),n.clearRect(0,3,16,1),n.clearRect(0,7,16,1),n.clearRect(0,11,16,1),e.vuMeterData[a][t]=e.vuDataCanvas.toDataURL("image/png")},this.testCanvas=function(){var a,t=document.createElement("canvas"),e=null;if(!t||"undefined"==typeof t.getContext)return null;if(e=t.getContext("2d"),!e||"function"!=typeof t.toDataURL)return null;try{a=t.toDataURL("image/png")}catch(n){return null}return t},this.init=function(){t.config.useFavIcon&&(e.vuDataCanvas=e.testCanvas(),e.vuDataCanvas&&(s||i)?e.createVUData():t.config.useFavIcon=!1)},this.init()},t.prototype.Metadata=function(a,t){soundManager._wD("Metadata()");var e,n,i=this,s=a._360data.oUI360,o=s.getElementsByTagName("ul")[0],d=o.getElementsByTagName("li");navigator.userAgent.match(/firefox/i);for(this.lastWPExec=0,this.refreshInterval=250,this.totalTime=0,this.events={whileplaying:function(){var e,n,s,o=a._360data.width,d=a._360data.radius,r=a.durationEstimate||1e3*i.totalTime,l=null;for(e=0,n=i.data.length;n>e;e++)l=e%2===0,t.drawSolidArc(a._360data.oCanvas,l?t.config.segmentRingColorAlt:t.config.segmentRingColor,l?o:o,l?d/2:d/2,t.deg2rad(360*(i.data[e].endTimeMS/r)),t.deg2rad(360*((i.data[e].startTimeMS||1)/r)),!0);s=new Date,s-i.lastWPExec>i.refreshInterval&&(i.refresh(),i.lastWPExec=s)}},this.refresh=function(){var t,e,n=null,i=a.position,s=a._360data.metadata.data;for(t=0,e=s.length;e>t;t++)if(i>=s[t].startTimeMS&&i<=s[t].endTimeMS){n=t;break}n!==s.currentItem&&n<s.length&&(a._360data.oLink.innerHTML=s.mainTitle+' <span class="metadata"><span class="sm2_divider"> | </span><span class="sm2_metadata">'+s[n].title+"</span></span>",s.currentItem=n)},this.strToTime=function(a){var t,e=a.split(":"),n=0;for(t=e.length;t--;)n+=parseInt(e[t],10)*Math.pow(60,e.length-1-t);return n},this.data=[],this.data.givenDuration=null,this.data.currentItem=null,this.data.mainTitle=a._360data.oLink.innerHTML,e=0;e<d.length;e++)this.data[e]={o:null,title:d[e].getElementsByTagName("p")[0].innerHTML,startTime:d[e].getElementsByTagName("span")[0].innerHTML,startSeconds:i.strToTime(d[e].getElementsByTagName("span")[0].innerHTML.replace(/[()]/g,"")),duration:0,durationMS:null,startTimeMS:null,endTimeMS:null,oNote:null};for(n=t.getElementsByClassName("duration","div",s),this.data.givenDuration=n.length?1e3*i.strToTime(n[0].innerHTML):0,e=0;e<this.data.length;e++)this.data[e].duration=parseInt(this.data[e+1]?this.data[e+1].startSeconds:(i.data.givenDuration?i.data.givenDuration:a.durationEstimate)/1e3,10)-this.data[e].startSeconds,this.data[e].startTimeMS=1e3*this.data[e].startSeconds,this.data[e].durationMS=1e3*this.data[e].duration,this.data[e].endTimeMS=this.data[e].startTimeMS+this.data[e].durationMS,this.totalTime+=this.data[e].duration},navigator.userAgent.match(/webkit/i)&&navigator.userAgent.match(/mobile/i)&&soundManager.setup({useHTML5Audio:!0}),soundManager.setup({html5PollingInterval:50,debugMode:a.location.href.match(/debug=1/i),consoleOnly:!0,flashVersion:9,useHighPerformance:!0}),soundManager.debugMode&&a.setInterval(function(){var t=a.threeSixtyPlayer;t&&t.lastSound&&t.lastSound._360data.fps&&"undefined"==typeof a.isHome&&(soundManager._writeDebug("fps: ~"+t.lastSound._360data.fps),t.lastSound._360data.fps=0)},1e3),a.ThreeSixtyPlayer=t}(window),threeSixtyPlayer=new ThreeSixtyPlayer,soundManager.onready(threeSixtyPlayer.init);
