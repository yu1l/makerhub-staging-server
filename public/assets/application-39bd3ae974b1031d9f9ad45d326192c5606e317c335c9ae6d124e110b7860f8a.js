/*! jQuery v3.0.0-beta1 | (c) jQuery Foundation | jquery.org/license */

!function(a,b){"object"==typeof module&&"object"==typeof module.exports?module.exports=a.document?b(a,!0):function(a){if(!a.document)throw new Error("jQuery requires a window with a document");return b(a)}:b(a)}("undefined"!=typeof window?window:this,function(a,b){var c=[],d=a.document,e=c.slice,f=c.concat,g=c.push,h=c.indexOf,i={},j=i.toString,k=i.hasOwnProperty,l={};function m(a,b){b=b||d;var c=b.createElement("script");c.text=a,b.head.appendChild(c).parentNode.removeChild(c)}var n="3.0.0-beta1",o=function(a,b){return new o.fn.init(a,b)},p=/^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g,q=/^-ms-/,r=/-([a-z])/g,s=function(a,b){return b.toUpperCase()};o.fn=o.prototype={jquery:n,constructor:o,length:0,toArray:function(){return e.call(this)},get:function(a){return null!=a?0>a?this[a+this.length]:this[a]:e.call(this)},pushStack:function(a){var b=o.merge(this.constructor(),a);return b.prevObject=this,b},each:function(a){return o.each(this,a)},map:function(a){return this.pushStack(o.map(this,function(b,c){return a.call(b,c,b)}))},slice:function(){return this.pushStack(e.apply(this,arguments))},first:function(){return this.eq(0)},last:function(){return this.eq(-1)},eq:function(a){var b=this.length,c=+a+(0>a?b:0);return this.pushStack(c>=0&&b>c?[this[c]]:[])},end:function(){return this.prevObject||this.constructor()},push:g,sort:c.sort,splice:c.splice},o.extend=o.fn.extend=function(){var a,b,c,d,e,f,g=arguments[0]||{},h=1,i=arguments.length,j=!1;for("boolean"==typeof g&&(j=g,g=arguments[h]||{},h++),"object"==typeof g||o.isFunction(g)||(g={}),h===i&&(g=this,h--);i>h;h++)if(null!=(a=arguments[h]))for(b in a)c=g[b],d=a[b],g!==d&&(j&&d&&(o.isPlainObject(d)||(e=o.isArray(d)))?(e?(e=!1,f=c&&o.isArray(c)?c:[]):f=c&&o.isPlainObject(c)?c:{},g[b]=o.extend(j,f,d)):void 0!==d&&(g[b]=d));return g},o.extend({expando:"jQuery"+(n+Math.random()).replace(/\D/g,""),isReady:!0,error:function(a){throw new Error(a)},noop:function(){},isFunction:function(a){return"function"===o.type(a)},isArray:Array.isArray,isWindow:function(a){return null!=a&&a===a.window},isNumeric:function(a){var b=o.type(a);return("number"===b||"string"===b)&&a-parseFloat(a)+1>=0},isPlainObject:function(a){return"object"!==o.type(a)||a.nodeType||o.isWindow(a)?!1:a.constructor&&!k.call(a.constructor.prototype,"isPrototypeOf")?!1:!0},isEmptyObject:function(a){var b;for(b in a)return!1;return!0},type:function(a){return null==a?a+"":"object"==typeof a||"function"==typeof a?i[j.call(a)]||"object":typeof a},globalEval:function(a){m(a)},camelCase:function(a){return a.replace(q,"ms-").replace(r,s)},nodeName:function(a,b){return a.nodeName&&a.nodeName.toLowerCase()===b.toLowerCase()},each:function(a,b){var c,d=0;if(t(a)){for(c=a.length;c>d;d++)if(b.call(a[d],d,a[d])===!1)break}else for(d in a)if(b.call(a[d],d,a[d])===!1)break;return a},trim:function(a){return null==a?"":(a+"").replace(p,"")},makeArray:function(a,b){var c=b||[];return null!=a&&(t(Object(a))?o.merge(c,"string"==typeof a?[a]:a):g.call(c,a)),c},inArray:function(a,b,c){return null==b?-1:h.call(b,a,c)},merge:function(a,b){for(var c=+b.length,d=0,e=a.length;c>d;d++)a[e++]=b[d];return a.length=e,a},grep:function(a,b,c){for(var d,e=[],f=0,g=a.length,h=!c;g>f;f++)d=!b(a[f],f),d!==h&&e.push(a[f]);return e},map:function(a,b,c){var d,e,g=0,h=[];if(t(a))for(d=a.length;d>g;g++)e=b(a[g],g,c),null!=e&&h.push(e);else for(g in a)e=b(a[g],g,c),null!=e&&h.push(e);return f.apply([],h)},guid:1,proxy:function(a,b){var c,d,f;return"string"==typeof b&&(c=a[b],b=a,a=c),o.isFunction(a)?(d=e.call(arguments,2),f=function(){return a.apply(b||this,d.concat(e.call(arguments)))},f.guid=a.guid=a.guid||o.guid++,f):void 0},now:Date.now,support:l}),"function"==typeof Symbol&&(o.fn[Symbol.iterator]=c[Symbol.iterator]),o.each("Boolean Number String Function Array Date RegExp Object Error Symbol".split(" "),function(a,b){i["[object "+b+"]"]=b.toLowerCase()});function t(a){var b=!!a&&"length"in a&&a.length,c=o.type(a);return"function"===c||o.isWindow(a)?!1:"array"===c||0===b||"number"==typeof b&&b>0&&b-1 in a}var u=function(a){var b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u="sizzle"+1*new Date,v=a.document,w=0,x=0,y=ha(),z=ha(),A=ha(),B=function(a,b){return a===b&&(l=!0),0},C={}.hasOwnProperty,D=[],E=D.pop,F=D.push,G=D.push,H=D.slice,I=function(a,b){for(var c=0,d=a.length;d>c;c++)if(a[c]===b)return c;return-1},J="checked|selected|async|autofocus|autoplay|controls|defer|disabled|hidden|ismap|loop|multiple|open|readonly|required|scoped",K="[\\x20\\t\\r\\n\\f]",L="(?:\\\\.|[\\w-]|[^\x00-\\xa0])+",M="\\["+K+"*("+L+")(?:"+K+"*([*^$|!~]?=)"+K+"*(?:'((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\"|("+L+"))|)"+K+"*\\]",N=":("+L+")(?:\\((('((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\")|((?:\\\\.|[^\\\\()[\\]]|"+M+")*)|.*)\\)|)",O=new RegExp(K+"+","g"),P=new RegExp("^"+K+"+|((?:^|[^\\\\])(?:\\\\.)*)"+K+"+$","g"),Q=new RegExp("^"+K+"*,"+K+"*"),R=new RegExp("^"+K+"*([>+~]|"+K+")"+K+"*"),S=new RegExp("="+K+"*([^\\]'\"]*?)"+K+"*\\]","g"),T=new RegExp(N),U=new RegExp("^"+L+"$"),V={ID:new RegExp("^#("+L+")"),CLASS:new RegExp("^\\.("+L+")"),TAG:new RegExp("^("+L+"|[*])"),ATTR:new RegExp("^"+M),PSEUDO:new RegExp("^"+N),CHILD:new RegExp("^:(only|first|last|nth|nth-last)-(child|of-type)(?:\\("+K+"*(even|odd|(([+-]|)(\\d*)n|)"+K+"*(?:([+-]|)"+K+"*(\\d+)|))"+K+"*\\)|)","i"),bool:new RegExp("^(?:"+J+")$","i"),needsContext:new RegExp("^"+K+"*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\\("+K+"*((?:-\\d)?\\d*)"+K+"*\\)|)(?=[^-]|$)","i")},W=/^(?:input|select|textarea|button)$/i,X=/^h\d$/i,Y=/^[^{]+\{\s*\[native \w/,Z=/^(?:#([\w-]+)|(\w+)|\.([\w-]+))$/,$=/[+~]/,_=new RegExp("\\\\([\\da-f]{1,6}"+K+"?|("+K+")|.)","ig"),aa=function(a,b,c){var d="0x"+b-65536;return d!==d||c?b:0>d?String.fromCharCode(d+65536):String.fromCharCode(d>>10|55296,1023&d|56320)},ba=/([\0-\x1f\x7f]|^-?\d)|^-$|[^\x80-\uFFFF\w-]/g,ca=function(a,b){return b?"\x00"===a?"\ufffd":a.slice(0,-1)+"\\"+a.charCodeAt(a.length-1).toString(16)+" ":"\\"+a},da=function(){m()},ea=ta(function(a){return a.disabled===!0},{dir:"parentNode",next:"legend"});try{G.apply(D=H.call(v.childNodes),v.childNodes),D[v.childNodes.length].nodeType}catch(fa){G={apply:D.length?function(a,b){F.apply(a,H.call(b))}:function(a,b){var c=a.length,d=0;while(a[c++]=b[d++]);a.length=c-1}}}function ga(a,b,d,e){var f,h,j,k,l,o,r,s=b&&b.ownerDocument,w=b?b.nodeType:9;if(d=d||[],"string"!=typeof a||!a||1!==w&&9!==w&&11!==w)return d;if(!e&&((b?b.ownerDocument||b:v)!==n&&m(b),b=b||n,p)){if(11!==w&&(l=Z.exec(a)))if(f=l[1]){if(9===w){if(!(j=b.getElementById(f)))return d;if(j.id===f)return d.push(j),d}else if(s&&(j=s.getElementById(f))&&t(b,j)&&j.id===f)return d.push(j),d}else{if(l[2])return G.apply(d,b.getElementsByTagName(a)),d;if((f=l[3])&&c.getElementsByClassName&&b.getElementsByClassName)return G.apply(d,b.getElementsByClassName(f)),d}if(c.qsa&&!A[a+" "]&&(!q||!q.test(a))){if(1!==w)s=b,r=a;else if("object"!==b.nodeName.toLowerCase()){(k=b.getAttribute("id"))?k=k.replace(ba,ca):b.setAttribute("id",k=u),o=g(a),h=o.length;while(h--)o[h]="#"+k+" "+sa(o[h]);r=o.join(","),s=$.test(a)&&qa(b.parentNode)||b}if(r)try{return G.apply(d,s.querySelectorAll(r)),d}catch(x){}finally{k===u&&b.removeAttribute("id")}}}return i(a.replace(P,"$1"),b,d,e)}function ha(){var a=[];function b(c,e){return a.push(c+" ")>d.cacheLength&&delete b[a.shift()],b[c+" "]=e}return b}function ia(a){return a[u]=!0,a}function ja(a){var b=n.createElement("fieldset");try{return!!a(b)}catch(c){return!1}finally{b.parentNode&&b.parentNode.removeChild(b),b=null}}function ka(a,b){var c=a.split("|"),e=c.length;while(e--)d.attrHandle[c[e]]=b}function la(a,b){var c=b&&a,d=c&&1===a.nodeType&&1===b.nodeType&&a.sourceIndex-b.sourceIndex;if(d)return d;if(c)while(c=c.nextSibling)if(c===b)return-1;return a?1:-1}function ma(a){return function(b){var c=b.nodeName.toLowerCase();return"input"===c&&b.type===a}}function na(a){return function(b){var c=b.nodeName.toLowerCase();return("input"===c||"button"===c)&&b.type===a}}function oa(a){return function(b){return"label"in b&&b.disabled===a||"form"in b&&b.disabled===a||"form"in b&&b.disabled===!1&&(b.isDisabled===a||b.isDisabled!==!a&&("label"in b||!ea(b))!==a)}}function pa(a){return ia(function(b){return b=+b,ia(function(c,d){var e,f=a([],c.length,b),g=f.length;while(g--)c[e=f[g]]&&(c[e]=!(d[e]=c[e]))})})}function qa(a){return a&&"undefined"!=typeof a.getElementsByTagName&&a}c=ga.support={},f=ga.isXML=function(a){var b=a&&(a.ownerDocument||a).documentElement;return b?"HTML"!==b.nodeName:!1},m=ga.setDocument=function(a){var b,e,g=a?a.ownerDocument||a:v;return g!==n&&9===g.nodeType&&g.documentElement?(n=g,o=n.documentElement,p=!f(n),v!==n&&(e=n.defaultView)&&e.top!==e&&(e.addEventListener?e.addEventListener("unload",da,!1):e.attachEvent&&e.attachEvent("onunload",da)),c.attributes=ja(function(a){return a.className="i",!a.getAttribute("className")}),c.getElementsByTagName=ja(function(a){return a.appendChild(n.createComment("")),!a.getElementsByTagName("*").length}),c.getElementsByClassName=Y.test(n.getElementsByClassName),c.getById=ja(function(a){return o.appendChild(a).id=u,!n.getElementsByName||!n.getElementsByName(u).length}),c.getById?(d.find.ID=function(a,b){if("undefined"!=typeof b.getElementById&&p){var c=b.getElementById(a);return c?[c]:[]}},d.filter.ID=function(a){var b=a.replace(_,aa);return function(a){return a.getAttribute("id")===b}}):(delete d.find.ID,d.filter.ID=function(a){var b=a.replace(_,aa);return function(a){var c="undefined"!=typeof a.getAttributeNode&&a.getAttributeNode("id");return c&&c.value===b}}),d.find.TAG=c.getElementsByTagName?function(a,b){return"undefined"!=typeof b.getElementsByTagName?b.getElementsByTagName(a):c.qsa?b.querySelectorAll(a):void 0}:function(a,b){var c,d=[],e=0,f=b.getElementsByTagName(a);if("*"===a){while(c=f[e++])1===c.nodeType&&d.push(c);return d}return f},d.find.CLASS=c.getElementsByClassName&&function(a,b){return"undefined"!=typeof b.getElementsByClassName&&p?b.getElementsByClassName(a):void 0},r=[],q=[],(c.qsa=Y.test(n.querySelectorAll))&&(ja(function(a){o.appendChild(a).innerHTML="<a id='"+u+"'></a><select id='"+u+"-\r\\' msallowcapture=''><option selected=''></option></select>",a.querySelectorAll("[msallowcapture^='']").length&&q.push("[*^$]="+K+"*(?:''|\"\")"),a.querySelectorAll("[selected]").length||q.push("\\["+K+"*(?:value|"+J+")"),a.querySelectorAll("[id~="+u+"-]").length||q.push("~="),a.querySelectorAll(":checked").length||q.push(":checked"),a.querySelectorAll("a#"+u+"+*").length||q.push(".#.+[+~]")}),ja(function(a){a.innerHTML="<a href='' disabled='disabled'></a><select disabled='disabled'><option/></select>";var b=n.createElement("input");b.setAttribute("type","hidden"),a.appendChild(b).setAttribute("name","D"),a.querySelectorAll("[name=d]").length&&q.push("name"+K+"*[*^$|!~]?="),2!==a.querySelectorAll(":enabled").length&&q.push(":enabled",":disabled"),o.appendChild(a).disabled=!0,2!==a.querySelectorAll(":disabled").length&&q.push(":enabled",":disabled"),a.querySelectorAll("*,:x"),q.push(",.*:")})),(c.matchesSelector=Y.test(s=o.matches||o.webkitMatchesSelector||o.mozMatchesSelector||o.oMatchesSelector||o.msMatchesSelector))&&ja(function(a){c.disconnectedMatch=s.call(a,"*"),s.call(a,"[s!='']:x"),r.push("!=",N)}),q=q.length&&new RegExp(q.join("|")),r=r.length&&new RegExp(r.join("|")),b=Y.test(o.compareDocumentPosition),t=b||Y.test(o.contains)?function(a,b){var c=9===a.nodeType?a.documentElement:a,d=b&&b.parentNode;return a===d||!(!d||1!==d.nodeType||!(c.contains?c.contains(d):a.compareDocumentPosition&&16&a.compareDocumentPosition(d)))}:function(a,b){if(b)while(b=b.parentNode)if(b===a)return!0;return!1},B=b?function(a,b){if(a===b)return l=!0,0;var d=!a.compareDocumentPosition-!b.compareDocumentPosition;return d?d:(d=(a.ownerDocument||a)===(b.ownerDocument||b)?a.compareDocumentPosition(b):1,1&d||!c.sortDetached&&b.compareDocumentPosition(a)===d?a===n||a.ownerDocument===v&&t(v,a)?-1:b===n||b.ownerDocument===v&&t(v,b)?1:k?I(k,a)-I(k,b):0:4&d?-1:1)}:function(a,b){if(a===b)return l=!0,0;var c,d=0,e=a.parentNode,f=b.parentNode,g=[a],h=[b];if(!e||!f)return a===n?-1:b===n?1:e?-1:f?1:k?I(k,a)-I(k,b):0;if(e===f)return la(a,b);c=a;while(c=c.parentNode)g.unshift(c);c=b;while(c=c.parentNode)h.unshift(c);while(g[d]===h[d])d++;return d?la(g[d],h[d]):g[d]===v?-1:h[d]===v?1:0},n):n},ga.matches=function(a,b){return ga(a,null,null,b)},ga.matchesSelector=function(a,b){if((a.ownerDocument||a)!==n&&m(a),b=b.replace(S,"='$1']"),c.matchesSelector&&p&&!A[b+" "]&&(!r||!r.test(b))&&(!q||!q.test(b)))try{var d=s.call(a,b);if(d||c.disconnectedMatch||a.document&&11!==a.document.nodeType)return d}catch(e){}return ga(b,n,null,[a]).length>0},ga.contains=function(a,b){return(a.ownerDocument||a)!==n&&m(a),t(a,b)},ga.attr=function(a,b){(a.ownerDocument||a)!==n&&m(a);var e=d.attrHandle[b.toLowerCase()],f=e&&C.call(d.attrHandle,b.toLowerCase())?e(a,b,!p):void 0;return void 0!==f?f:c.attributes||!p?a.getAttribute(b):(f=a.getAttributeNode(b))&&f.specified?f.value:null},ga.escape=function(a){return(a+"").replace(ba,ca)},ga.error=function(a){throw new Error("Syntax error, unrecognized expression: "+a)},ga.uniqueSort=function(a){var b,d=[],e=0,f=0;if(l=!c.detectDuplicates,k=!c.sortStable&&a.slice(0),a.sort(B),l){while(b=a[f++])b===a[f]&&(e=d.push(f));while(e--)a.splice(d[e],1)}return k=null,a},e=ga.getText=function(a){var b,c="",d=0,f=a.nodeType;if(f){if(1===f||9===f||11===f){if("string"==typeof a.textContent)return a.textContent;for(a=a.firstChild;a;a=a.nextSibling)c+=e(a)}else if(3===f||4===f)return a.nodeValue}else while(b=a[d++])c+=e(b);return c},d=ga.selectors={cacheLength:50,createPseudo:ia,match:V,attrHandle:{},find:{},relative:{">":{dir:"parentNode",first:!0}," ":{dir:"parentNode"},"+":{dir:"previousSibling",first:!0},"~":{dir:"previousSibling"}},preFilter:{ATTR:function(a){return a[1]=a[1].replace(_,aa),a[3]=(a[3]||a[4]||a[5]||"").replace(_,aa),"~="===a[2]&&(a[3]=" "+a[3]+" "),a.slice(0,4)},CHILD:function(a){return a[1]=a[1].toLowerCase(),"nth"===a[1].slice(0,3)?(a[3]||ga.error(a[0]),a[4]=+(a[4]?a[5]+(a[6]||1):2*("even"===a[3]||"odd"===a[3])),a[5]=+(a[7]+a[8]||"odd"===a[3])):a[3]&&ga.error(a[0]),a},PSEUDO:function(a){var b,c=!a[6]&&a[2];return V.CHILD.test(a[0])?null:(a[3]?a[2]=a[4]||a[5]||"":c&&T.test(c)&&(b=g(c,!0))&&(b=c.indexOf(")",c.length-b)-c.length)&&(a[0]=a[0].slice(0,b),a[2]=c.slice(0,b)),a.slice(0,3))}},filter:{TAG:function(a){var b=a.replace(_,aa).toLowerCase();return"*"===a?function(){return!0}:function(a){return a.nodeName&&a.nodeName.toLowerCase()===b}},CLASS:function(a){var b=y[a+" "];return b||(b=new RegExp("(^|"+K+")"+a+"("+K+"|$)"))&&y(a,function(a){return b.test("string"==typeof a.className&&a.className||"undefined"!=typeof a.getAttribute&&a.getAttribute("class")||"")})},ATTR:function(a,b,c){return function(d){var e=ga.attr(d,a);return null==e?"!="===b:b?(e+="","="===b?e===c:"!="===b?e!==c:"^="===b?c&&0===e.indexOf(c):"*="===b?c&&e.indexOf(c)>-1:"$="===b?c&&e.slice(-c.length)===c:"~="===b?(" "+e.replace(O," ")+" ").indexOf(c)>-1:"|="===b?e===c||e.slice(0,c.length+1)===c+"-":!1):!0}},CHILD:function(a,b,c,d,e){var f="nth"!==a.slice(0,3),g="last"!==a.slice(-4),h="of-type"===b;return 1===d&&0===e?function(a){return!!a.parentNode}:function(b,c,i){var j,k,l,m,n,o,p=f!==g?"nextSibling":"previousSibling",q=b.parentNode,r=h&&b.nodeName.toLowerCase(),s=!i&&!h,t=!1;if(q){if(f){while(p){m=b;while(m=m[p])if(h?m.nodeName.toLowerCase()===r:1===m.nodeType)return!1;o=p="only"===a&&!o&&"nextSibling"}return!0}if(o=[g?q.firstChild:q.lastChild],g&&s){m=q,l=m[u]||(m[u]={}),k=l[m.uniqueID]||(l[m.uniqueID]={}),j=k[a]||[],n=j[0]===w&&j[1],t=n&&j[2],m=n&&q.childNodes[n];while(m=++n&&m&&m[p]||(t=n=0)||o.pop())if(1===m.nodeType&&++t&&m===b){k[a]=[w,n,t];break}}else if(s&&(m=b,l=m[u]||(m[u]={}),k=l[m.uniqueID]||(l[m.uniqueID]={}),j=k[a]||[],n=j[0]===w&&j[1],t=n),t===!1)while(m=++n&&m&&m[p]||(t=n=0)||o.pop())if((h?m.nodeName.toLowerCase()===r:1===m.nodeType)&&++t&&(s&&(l=m[u]||(m[u]={}),k=l[m.uniqueID]||(l[m.uniqueID]={}),k[a]=[w,t]),m===b))break;return t-=e,t===d||t%d===0&&t/d>=0}}},PSEUDO:function(a,b){var c,e=d.pseudos[a]||d.setFilters[a.toLowerCase()]||ga.error("unsupported pseudo: "+a);return e[u]?e(b):e.length>1?(c=[a,a,"",b],d.setFilters.hasOwnProperty(a.toLowerCase())?ia(function(a,c){var d,f=e(a,b),g=f.length;while(g--)d=I(a,f[g]),a[d]=!(c[d]=f[g])}):function(a){return e(a,0,c)}):e}},pseudos:{not:ia(function(a){var b=[],c=[],d=h(a.replace(P,"$1"));return d[u]?ia(function(a,b,c,e){var f,g=d(a,null,e,[]),h=a.length;while(h--)(f=g[h])&&(a[h]=!(b[h]=f))}):function(a,e,f){return b[0]=a,d(b,null,f,c),b[0]=null,!c.pop()}}),has:ia(function(a){return function(b){return ga(a,b).length>0}}),contains:ia(function(a){return a=a.replace(_,aa),function(b){return(b.textContent||b.innerText||e(b)).indexOf(a)>-1}}),lang:ia(function(a){return U.test(a||"")||ga.error("unsupported lang: "+a),a=a.replace(_,aa).toLowerCase(),function(b){var c;do if(c=p?b.lang:b.getAttribute("xml:lang")||b.getAttribute("lang"))return c=c.toLowerCase(),c===a||0===c.indexOf(a+"-");while((b=b.parentNode)&&1===b.nodeType);return!1}}),target:function(b){var c=a.location&&a.location.hash;return c&&c.slice(1)===b.id},root:function(a){return a===o},focus:function(a){return a===n.activeElement&&(!n.hasFocus||n.hasFocus())&&!!(a.type||a.href||~a.tabIndex)},enabled:oa(!1),disabled:oa(!0),checked:function(a){var b=a.nodeName.toLowerCase();return"input"===b&&!!a.checked||"option"===b&&!!a.selected},selected:function(a){return a.parentNode&&a.parentNode.selectedIndex,a.selected===!0},empty:function(a){for(a=a.firstChild;a;a=a.nextSibling)if(a.nodeType<6)return!1;return!0},parent:function(a){return!d.pseudos.empty(a)},header:function(a){return X.test(a.nodeName)},input:function(a){return W.test(a.nodeName)},button:function(a){var b=a.nodeName.toLowerCase();return"input"===b&&"button"===a.type||"button"===b},text:function(a){var b;return"input"===a.nodeName.toLowerCase()&&"text"===a.type&&(null==(b=a.getAttribute("type"))||"text"===b.toLowerCase())},first:pa(function(){return[0]}),last:pa(function(a,b){return[b-1]}),eq:pa(function(a,b,c){return[0>c?c+b:c]}),even:pa(function(a,b){for(var c=0;b>c;c+=2)a.push(c);return a}),odd:pa(function(a,b){for(var c=1;b>c;c+=2)a.push(c);return a}),lt:pa(function(a,b,c){for(var d=0>c?c+b:c;--d>=0;)a.push(d);return a}),gt:pa(function(a,b,c){for(var d=0>c?c+b:c;++d<b;)a.push(d);return a})}},d.pseudos.nth=d.pseudos.eq;for(b in{radio:!0,checkbox:!0,file:!0,password:!0,image:!0})d.pseudos[b]=ma(b);for(b in{submit:!0,reset:!0})d.pseudos[b]=na(b);function ra(){}ra.prototype=d.filters=d.pseudos,d.setFilters=new ra,g=ga.tokenize=function(a,b){var c,e,f,g,h,i,j,k=z[a+" "];if(k)return b?0:k.slice(0);h=a,i=[],j=d.preFilter;while(h){(!c||(e=Q.exec(h)))&&(e&&(h=h.slice(e[0].length)||h),i.push(f=[])),c=!1,(e=R.exec(h))&&(c=e.shift(),f.push({value:c,type:e[0].replace(P," ")}),h=h.slice(c.length));for(g in d.filter)!(e=V[g].exec(h))||j[g]&&!(e=j[g](e))||(c=e.shift(),f.push({value:c,type:g,matches:e}),h=h.slice(c.length));if(!c)break}return b?h.length:h?ga.error(a):z(a,i).slice(0)};function sa(a){for(var b=0,c=a.length,d="";c>b;b++)d+=a[b].value;return d}function ta(a,b,c){var d=b.dir,e=b.next,f=e||d,g=c&&"parentNode"===f,h=x++;return b.first?function(b,c,e){while(b=b[d])if(1===b.nodeType||g)return a(b,c,e)}:function(b,c,i){var j,k,l,m=[w,h];if(i){while(b=b[d])if((1===b.nodeType||g)&&a(b,c,i))return!0}else while(b=b[d])if(1===b.nodeType||g)if(l=b[u]||(b[u]={}),k=l[b.uniqueID]||(l[b.uniqueID]={}),e&&e===b.nodeName.toLowerCase())b=b[d]||b;else{if((j=k[f])&&j[0]===w&&j[1]===h)return m[2]=j[2];if(k[f]=m,m[2]=a(b,c,i))return!0}}}function ua(a){return a.length>1?function(b,c,d){var e=a.length;while(e--)if(!a[e](b,c,d))return!1;return!0}:a[0]}function va(a,b,c){for(var d=0,e=b.length;e>d;d++)ga(a,b[d],c);return c}function wa(a,b,c,d,e){for(var f,g=[],h=0,i=a.length,j=null!=b;i>h;h++)(f=a[h])&&(!c||c(f,d,e))&&(g.push(f),j&&b.push(h));return g}function xa(a,b,c,d,e,f){return d&&!d[u]&&(d=xa(d)),e&&!e[u]&&(e=xa(e,f)),ia(function(f,g,h,i){var j,k,l,m=[],n=[],o=g.length,p=f||va(b||"*",h.nodeType?[h]:h,[]),q=!a||!f&&b?p:wa(p,m,a,h,i),r=c?e||(f?a:o||d)?[]:g:q;if(c&&c(q,r,h,i),d){j=wa(r,n),d(j,[],h,i),k=j.length;while(k--)(l=j[k])&&(r[n[k]]=!(q[n[k]]=l))}if(f){if(e||a){if(e){j=[],k=r.length;while(k--)(l=r[k])&&j.push(q[k]=l);e(null,r=[],j,i)}k=r.length;while(k--)(l=r[k])&&(j=e?I(f,l):m[k])>-1&&(f[j]=!(g[j]=l))}}else r=wa(r===g?r.splice(o,r.length):r),e?e(null,g,r,i):G.apply(g,r)})}function ya(a){for(var b,c,e,f=a.length,g=d.relative[a[0].type],h=g||d.relative[" "],i=g?1:0,k=ta(function(a){return a===b},h,!0),l=ta(function(a){return I(b,a)>-1},h,!0),m=[function(a,c,d){var e=!g&&(d||c!==j)||((b=c).nodeType?k(a,c,d):l(a,c,d));return b=null,e}];f>i;i++)if(c=d.relative[a[i].type])m=[ta(ua(m),c)];else{if(c=d.filter[a[i].type].apply(null,a[i].matches),c[u]){for(e=++i;f>e;e++)if(d.relative[a[e].type])break;return xa(i>1&&ua(m),i>1&&sa(a.slice(0,i-1).concat({value:" "===a[i-2].type?"*":""})).replace(P,"$1"),c,e>i&&ya(a.slice(i,e)),f>e&&ya(a=a.slice(e)),f>e&&sa(a))}m.push(c)}return ua(m)}function za(a,b){var c=b.length>0,e=a.length>0,f=function(f,g,h,i,k){var l,o,q,r=0,s="0",t=f&&[],u=[],v=j,x=f||e&&d.find.TAG("*",k),y=w+=null==v?1:Math.random()||.1,z=x.length;for(k&&(j=g===n||g||k);s!==z&&null!=(l=x[s]);s++){if(e&&l){o=0,g||l.ownerDocument===n||(m(l),h=!p);while(q=a[o++])if(q(l,g||n,h)){i.push(l);break}k&&(w=y)}c&&((l=!q&&l)&&r--,f&&t.push(l))}if(r+=s,c&&s!==r){o=0;while(q=b[o++])q(t,u,g,h);if(f){if(r>0)while(s--)t[s]||u[s]||(u[s]=E.call(i));u=wa(u)}G.apply(i,u),k&&!f&&u.length>0&&r+b.length>1&&ga.uniqueSort(i)}return k&&(w=y,j=v),t};return c?ia(f):f}return h=ga.compile=function(a,b){var c,d=[],e=[],f=A[a+" "];if(!f){b||(b=g(a)),c=b.length;while(c--)f=ya(b[c]),f[u]?d.push(f):e.push(f);f=A(a,za(e,d)),f.selector=a}return f},i=ga.select=function(a,b,e,f){var i,j,k,l,m,n="function"==typeof a&&a,o=!f&&g(a=n.selector||a);if(e=e||[],1===o.length){if(j=o[0]=o[0].slice(0),j.length>2&&"ID"===(k=j[0]).type&&c.getById&&9===b.nodeType&&p&&d.relative[j[1].type]){if(b=(d.find.ID(k.matches[0].replace(_,aa),b)||[])[0],!b)return e;n&&(b=b.parentNode),a=a.slice(j.shift().value.length)}i=V.needsContext.test(a)?0:j.length;while(i--){if(k=j[i],d.relative[l=k.type])break;if((m=d.find[l])&&(f=m(k.matches[0].replace(_,aa),$.test(j[0].type)&&qa(b.parentNode)||b))){if(j.splice(i,1),a=f.length&&sa(j),!a)return G.apply(e,f),e;break}}}return(n||h(a,o))(f,b,!p,e,!b||$.test(a)&&qa(b.parentNode)||b),e},c.sortStable=u.split("").sort(B).join("")===u,c.detectDuplicates=!!l,m(),c.sortDetached=ja(function(a){return 1&a.compareDocumentPosition(n.createElement("fieldset"))}),ja(function(a){return a.innerHTML="<a href='#'></a>","#"===a.firstChild.getAttribute("href")})||ka("type|href|height|width",function(a,b,c){return c?void 0:a.getAttribute(b,"type"===b.toLowerCase()?1:2)}),c.attributes&&ja(function(a){return a.innerHTML="<input/>",a.firstChild.setAttribute("value",""),""===a.firstChild.getAttribute("value")})||ka("value",function(a,b,c){return c||"input"!==a.nodeName.toLowerCase()?void 0:a.defaultValue}),ja(function(a){return null==a.getAttribute("disabled")})||ka(J,function(a,b,c){var d;return c?void 0:a[b]===!0?b.toLowerCase():(d=a.getAttributeNode(b))&&d.specified?d.value:null}),ga}(a);o.find=u,o.expr=u.selectors,o.expr[":"]=o.expr.pseudos,o.uniqueSort=o.unique=u.uniqueSort,o.text=u.getText,o.isXMLDoc=u.isXML,o.contains=u.contains;var v=function(a,b,c){var d=[],e=void 0!==c;while((a=a[b])&&9!==a.nodeType)if(1===a.nodeType){if(e&&o(a).is(c))break;d.push(a)}return d},w=function(a,b){for(var c=[];a;a=a.nextSibling)1===a.nodeType&&a!==b&&c.push(a);return c},x=o.expr.match.needsContext,y=/^<([a-z][^\/\0>:\x20\t\r\n\f]*)[\x20\t\r\n\f]*\/?>(?:<\/\1>|)$/i,z=/^.[^:#\[\.,]*$/;function A(a,b,c){if(o.isFunction(b))return o.grep(a,function(a,d){return!!b.call(a,d,a)!==c});if(b.nodeType)return o.grep(a,function(a){return a===b!==c});if("string"==typeof b){if(z.test(b))return o.filter(b,a,c);b=o.filter(b,a)}return o.grep(a,function(a){return h.call(b,a)>-1!==c&&1===a.nodeType})}o.filter=function(a,b,c){var d=b[0];return c&&(a=":not("+a+")"),1===b.length&&1===d.nodeType?o.find.matchesSelector(d,a)?[d]:[]:o.find.matches(a,o.grep(b,function(a){return 1===a.nodeType}))},o.fn.extend({find:function(a){var b,c=this.length,d=[],e=this;if("string"!=typeof a)return this.pushStack(o(a).filter(function(){for(b=0;c>b;b++)if(o.contains(e[b],this))return!0}));for(b=0;c>b;b++)o.find(a,e[b],d);return this.pushStack(c>1?o.uniqueSort(d):d)},filter:function(a){return this.pushStack(A(this,a||[],!1))},not:function(a){return this.pushStack(A(this,a||[],!0))},is:function(a){return!!A(this,"string"==typeof a&&x.test(a)?o(a):a||[],!1).length}});var B,C=/^(?:\s*(<[\w\W]+>)[^>]*|#([\w-]+))$/,D=o.fn.init=function(a,b,c){var e,f;if(!a)return this;if(c=c||B,"string"==typeof a){if(e="<"===a[0]&&">"===a[a.length-1]&&a.length>=3?[null,a,null]:C.exec(a),!e||!e[1]&&b)return!b||b.jquery?(b||c).find(a):this.constructor(b).find(a);if(e[1]){if(b=b instanceof o?b[0]:b,o.merge(this,o.parseHTML(e[1],b&&b.nodeType?b.ownerDocument||b:d,!0)),y.test(e[1])&&o.isPlainObject(b))for(e in b)o.isFunction(this[e])?this[e](b[e]):this.attr(e,b[e]);return this}return f=d.getElementById(e[2]),f&&(this[0]=f,this.length=1),this}return a.nodeType?(this[0]=a,this.length=1,this):o.isFunction(a)?void 0!==c.ready?c.ready(a):a(o):o.makeArray(a,this)};D.prototype=o.fn,B=o(d);var E=/^(?:parents|prev(?:Until|All))/,F={children:!0,contents:!0,next:!0,prev:!0};o.fn.extend({has:function(a){var b=o(a,this),c=b.length;return this.filter(function(){for(var a=0;c>a;a++)if(o.contains(this,b[a]))return!0})},closest:function(a,b){var c,d=0,e=this.length,f=[],g="string"!=typeof a&&o(a);if(!x.test(a))for(;e>d;d++)for(c=this[d];c&&c!==b;c=c.parentNode)if(c.nodeType<11&&(g?g.index(c)>-1:1===c.nodeType&&o.find.matchesSelector(c,a))){f.push(c);break}return this.pushStack(f.length>1?o.uniqueSort(f):f)},index:function(a){return a?"string"==typeof a?h.call(o(a),this[0]):h.call(this,a.jquery?a[0]:a):this[0]&&this[0].parentNode?this.first().prevAll().length:-1},add:function(a,b){return this.pushStack(o.uniqueSort(o.merge(this.get(),o(a,b))))},addBack:function(a){return this.add(null==a?this.prevObject:this.prevObject.filter(a))}});function G(a,b){while((a=a[b])&&1!==a.nodeType);return a}o.each({parent:function(a){var b=a.parentNode;return b&&11!==b.nodeType?b:null},parents:function(a){return v(a,"parentNode")},parentsUntil:function(a,b,c){return v(a,"parentNode",c)},next:function(a){return G(a,"nextSibling")},prev:function(a){return G(a,"previousSibling")},nextAll:function(a){return v(a,"nextSibling")},prevAll:function(a){return v(a,"previousSibling")},nextUntil:function(a,b,c){return v(a,"nextSibling",c)},prevUntil:function(a,b,c){return v(a,"previousSibling",c)},siblings:function(a){return w((a.parentNode||{}).firstChild,a)},children:function(a){return w(a.firstChild)},contents:function(a){return a.contentDocument||o.merge([],a.childNodes)}},function(a,b){o.fn[a]=function(c,d){var e=o.map(this,b,c);return"Until"!==a.slice(-5)&&(d=c),d&&"string"==typeof d&&(e=o.filter(d,e)),this.length>1&&(F[a]||o.uniqueSort(e),E.test(a)&&e.reverse()),this.pushStack(e)}});var H=/\S+/g;function I(a){var b={};return o.each(a.match(H)||[],function(a,c){b[c]=!0}),b}o.Callbacks=function(a){a="string"==typeof a?I(a):o.extend({},a);var b,c,d,e,f=[],g=[],h=-1,i=function(){for(e=a.once,d=b=!0;g.length;h=-1){c=g.shift();while(++h<f.length)f[h].apply(c[0],c[1])===!1&&a.stopOnFalse&&(h=f.length,c=!1)}a.memory||(c=!1),b=!1,e&&(f=c?[]:"")},j={add:function(){return f&&(c&&!b&&(h=f.length-1,g.push(c)),function d(b){o.each(b,function(b,c){o.isFunction(c)?a.unique&&j.has(c)||f.push(c):c&&c.length&&"string"!==o.type(c)&&d(c)})}(arguments),c&&!b&&i()),this},remove:function(){return o.each(arguments,function(a,b){var c;while((c=o.inArray(b,f,c))>-1)f.splice(c,1),h>=c&&h--}),this},has:function(a){return a?o.inArray(a,f)>-1:f.length>0},empty:function(){return f&&(f=[]),this},disable:function(){return e=g=[],f=c="",this},disabled:function(){return!f},lock:function(){return e=g=[],c||b||(f=c=""),this},locked:function(){return!!e},fireWith:function(a,c){return e||(c=c||[],c=[a,c.slice?c.slice():c],g.push(c),b||i()),this},fire:function(){return j.fireWith(this,arguments),this},fired:function(){return!!d}};return j};function J(a){return a}function K(a){throw a}o.extend({Deferred:function(b){var c=[["notify","progress",o.Callbacks("memory"),o.Callbacks("memory"),2],["resolve","done",o.Callbacks("once memory"),o.Callbacks("once memory"),0,"resolved"],["reject","fail",o.Callbacks("once memory"),o.Callbacks("once memory"),1,"rejected"]],d="pending",e={state:function(){return d},always:function(){return f.done(arguments).fail(arguments),this},"catch":function(a){return e.then(null,a)},pipe:function(){var a=arguments;return o.Deferred(function(b){o.each(c,function(c,d){var g=o.isFunction(a[d[4]])&&a[d[4]];f[d[1]](function(){var a=g&&g.apply(this,arguments);a&&o.isFunction(a.promise)?a.promise().progress(b.notify).done(b.resolve).fail(b.reject):b[d[0]+"With"](this===e?b.promise():this,g?[a]:arguments)})}),a=null}).promise()},then:function(b,d,f){var g=0;function h(b,c,d,f){return function(){var i=this===e?void 0:this,j=arguments,k=function(){var a,e;if(!(g>b)){if(a=d.apply(i,j),a===c.promise())throw new TypeError("Thenable self-resolution");e=a&&("object"==typeof a||"function"==typeof a)&&a.then,o.isFunction(e)?f?e.call(a,h(g,c,J,f),h(g,c,K,f)):(g++,e.call(a,h(g,c,J,f),h(g,c,K,f),h(g,c,J,c.notify))):(d!==J&&(i=void 0,j=[a]),(f||c.resolveWith)(i||c.promise(),j))}},l=f?k:function(){try{k()}catch(a){o.Deferred.exceptionHook&&o.Deferred.exceptionHook(a,l.stackTrace),b+1>=g&&(d!==K&&(i=void 0,j=[a]),c.rejectWith(i||c.promise(),j))}};b?l():(o.Deferred.getStackHook&&(l.stackTrace=o.Deferred.getStackHook()),a.setTimeout(l))}}return o.Deferred(function(a){c[0][3].add(h(0,a,o.isFunction(f)?f:J,a.notifyWith)),c[1][3].add(h(0,a,o.isFunction(b)?b:J)),c[2][3].add(h(0,a,o.isFunction(d)?d:K))}).promise()},promise:function(a){return null!=a?o.extend(a,e):e}},f={};return o.each(c,function(a,b){var g=b[2],h=b[5];e[b[1]]=g.add,h&&g.add(function(){d=h},c[3-a][2].disable,c[0][2].lock),g.add(b[3].fire),f[b[0]]=function(){return f[b[0]+"With"](this===f?e:this,arguments),this},f[b[0]+"With"]=g.fireWith}),e.promise(f),b&&b.call(f,f),f},when:function(){var a,b,c=0,d=e.call(arguments),f=d.length,g=f,h=o.Deferred(),i=function(a){return function(c){b[a]=this,d[a]=arguments.length>1?e.call(arguments):c,--g||h.resolveWith(1===b.length?b[0]:b,d)}};if(f>0)for(b=new Array(f);f>c;c++)d[c]&&o.isFunction(a=d[c].promise)?a.call(d[c]).done(i(c)).fail(h.reject):d[c]&&o.isFunction(a=d[c].then)?a.call(d[c],i(c),h.reject):i(c)(d[c]);else h.resolveWith();return h.promise()}});var L=/^(Eval|Internal|Range|Reference|Syntax|Type|URI)Error$/;o.Deferred.exceptionHook=function(b,c){a.console&&a.console.warn&&b&&L.test(b.name)&&a.console.warn("jQuery.Deferred exception: "+b.message,c)};var M;o.fn.ready=function(a){return o.ready.promise().done(a),this},o.extend({isReady:!1,readyWait:1,holdReady:function(a){a?o.readyWait++:o.ready(!0)},ready:function(a){(a===!0?--o.readyWait:o.isReady)||(o.isReady=!0,a!==!0&&--o.readyWait>0||M.resolveWith(d,[o]))}});function N(){d.removeEventListener("DOMContentLoaded",N),a.removeEventListener("load",N),o.ready()}o.ready.promise=function(b){return M||(M=o.Deferred(),"complete"===d.readyState||"loading"!==d.readyState&&!d.documentElement.doScroll?a.setTimeout(o.ready):(d.addEventListener("DOMContentLoaded",N),a.addEventListener("load",N))),M.promise(b)},o.ready.promise();var O=function(a,b,c,d,e,f,g){var h=0,i=a.length,j=null==c;if("object"===o.type(c)){e=!0;for(h in c)O(a,b,h,c[h],!0,f,g)}else if(void 0!==d&&(e=!0,o.isFunction(d)||(g=!0),j&&(g?(b.call(a,d),b=null):(j=b,b=function(a,b,c){return j.call(o(a),c)})),b))for(;i>h;h++)b(a[h],c,g?d:d.call(a[h],h,b(a[h],c)));return e?a:j?b.call(a):i?b(a[0],c):f;
},P=function(a){return 1===a.nodeType||9===a.nodeType||!+a.nodeType};function Q(){this.expando=o.expando+Q.uid++}Q.uid=1,Q.prototype={cache:function(a){var b=a[this.expando];return b||(b={},P(a)&&(a.nodeType?a[this.expando]=b:Object.defineProperty(a,this.expando,{value:b,configurable:!0}))),b},set:function(a,b,c){var d,e=this.cache(a);if("string"==typeof b)e[o.camelCase(b)]=c;else for(d in b)e[o.camelCase(d)]=b[d];return e},get:function(a,b){return void 0===b?this.cache(a):a[this.expando]&&a[this.expando][o.camelCase(b)]},access:function(a,b,c){return void 0===b||b&&"string"==typeof b&&void 0===c?this.get(a,b):(this.set(a,b,c),void 0!==c?c:b)},remove:function(a,b){var c,d=a[this.expando];if(void 0!==d){if(void 0!==b){o.isArray(b)?b=b.map(o.camelCase):(b=o.camelCase(b),b=b in d?[b]:b.match(H)||[]),c=b.length;while(c--)delete d[b[c]]}(void 0===b||o.isEmptyObject(d))&&(a.nodeType?a[this.expando]=void 0:delete a[this.expando])}},hasData:function(a){var b=a[this.expando];return void 0!==b&&!o.isEmptyObject(b)}};var R=new Q,S=new Q,T=/^(?:\{[\w\W]*\}|\[[\w\W]*\])$/,U=/[A-Z]/g;function V(a,b,c){var d;if(void 0===c&&1===a.nodeType)if(d="data-"+b.replace(U,"-$&").toLowerCase(),c=a.getAttribute(d),"string"==typeof c){try{c="true"===c?!0:"false"===c?!1:"null"===c?null:+c+""===c?+c:T.test(c)?o.parseJSON(c):c}catch(e){}S.set(a,b,c)}else c=void 0;return c}o.extend({hasData:function(a){return S.hasData(a)||R.hasData(a)},data:function(a,b,c){return S.access(a,b,c)},removeData:function(a,b){S.remove(a,b)},_data:function(a,b,c){return R.access(a,b,c)},_removeData:function(a,b){R.remove(a,b)}}),o.fn.extend({data:function(a,b){var c,d,e,f=this[0],g=f&&f.attributes;if(void 0===a){if(this.length&&(e=S.get(f),1===f.nodeType&&!R.get(f,"hasDataAttrs"))){c=g.length;while(c--)g[c]&&(d=g[c].name,0===d.indexOf("data-")&&(d=o.camelCase(d.slice(5)),V(f,d,e[d])));R.set(f,"hasDataAttrs",!0)}return e}return"object"==typeof a?this.each(function(){S.set(this,a)}):O(this,function(b){var c;if(f&&void 0===b){if(c=S.get(f,a),void 0!==c)return c;if(c=V(f,a),void 0!==c)return c}else this.each(function(){S.set(this,a,b)})},null,b,arguments.length>1,null,!0)},removeData:function(a){return this.each(function(){S.remove(this,a)})}}),o.extend({queue:function(a,b,c){var d;return a?(b=(b||"fx")+"queue",d=R.get(a,b),c&&(!d||o.isArray(c)?d=R.access(a,b,o.makeArray(c)):d.push(c)),d||[]):void 0},dequeue:function(a,b){b=b||"fx";var c=o.queue(a,b),d=c.length,e=c.shift(),f=o._queueHooks(a,b),g=function(){o.dequeue(a,b)};"inprogress"===e&&(e=c.shift(),d--),e&&("fx"===b&&c.unshift("inprogress"),delete f.stop,e.call(a,g,f)),!d&&f&&f.empty.fire()},_queueHooks:function(a,b){var c=b+"queueHooks";return R.get(a,c)||R.access(a,c,{empty:o.Callbacks("once memory").add(function(){R.remove(a,[b+"queue",c])})})}}),o.fn.extend({queue:function(a,b){var c=2;return"string"!=typeof a&&(b=a,a="fx",c--),arguments.length<c?o.queue(this[0],a):void 0===b?this:this.each(function(){var c=o.queue(this,a,b);o._queueHooks(this,a),"fx"===a&&"inprogress"!==c[0]&&o.dequeue(this,a)})},dequeue:function(a){return this.each(function(){o.dequeue(this,a)})},clearQueue:function(a){return this.queue(a||"fx",[])},promise:function(a,b){var c,d=1,e=o.Deferred(),f=this,g=this.length,h=function(){--d||e.resolveWith(f,[f])};"string"!=typeof a&&(b=a,a=void 0),a=a||"fx";while(g--)c=R.get(f[g],a+"queueHooks"),c&&c.empty&&(d++,c.empty.add(h));return h(),e.promise(b)}});var W=/[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source,X=new RegExp("^(?:([+-])=|)("+W+")([a-z%]*)$","i"),Y=["Top","Right","Bottom","Left"],Z=function(a,b){return a=b||a,"none"===o.css(a,"display")||!o.contains(a.ownerDocument,a)},$=function(a,b,c,d){var e,f,g={};for(f in b)g[f]=a.style[f],a.style[f]=b[f];e=c.apply(a,d||[]);for(f in b)a.style[f]=g[f];return e};function _(a,b,c,d){var e,f=1,g=20,h=d?function(){return d.cur()}:function(){return o.css(a,b,"")},i=h(),j=c&&c[3]||(o.cssNumber[b]?"":"px"),k=(o.cssNumber[b]||"px"!==j&&+i)&&X.exec(o.css(a,b));if(k&&k[3]!==j){j=j||k[3],c=c||[],k=+i||1;do f=f||".5",k/=f,o.style(a,b,k+j);while(f!==(f=h()/i)&&1!==f&&--g)}return c&&(k=+k||+i||0,e=c[1]?k+(c[1]+1)*c[2]:+c[2],d&&(d.unit=j,d.start=k,d.end=e)),e}var aa={};function ba(a){var b,c=a.ownerDocument,d=a.nodeName,e=aa[d];return e?e:(b=c.body.appendChild(c.createElement(d)),e=o.css(b,"display"),b.parentNode.removeChild(b),"none"===e&&(e="block"),aa[d]=e,e)}function ca(a,b){for(var c,d,e=[],f=0,g=a.length;g>f;f++)d=a[f],d.style&&(c=d.style.display,b?("none"===c&&(e[f]=R.get(d,"display")||null,e[f]||(d.style.display="")),""===d.style.display&&"none"===o.css(d,"display")&&o.contains(d.ownerDocument,d)&&(e[f]=ba(d))):"none"!==c&&(e[f]="none",R.set(d,"display",c)));for(f=0;g>f;f++)null!=e[f]&&(a[f].style.display=e[f]);return a}o.fn.extend({show:function(){return ca(this,!0)},hide:function(){return ca(this)},toggle:function(a){return"boolean"==typeof a?a?this.show():this.hide():this.each(function(){Z(this)?o(this).show():o(this).hide()})}});var da=/^(?:checkbox|radio)$/i,ea=/<([a-z][^\/\0>\x20\t\r\n\f]+)/i,fa=/^$|\/(?:java|ecma)script/i,ga={option:[1,"<select multiple='multiple'>","</select>"],thead:[1,"<table>","</table>"],col:[2,"<table><colgroup>","</colgroup></table>"],tr:[2,"<table><tbody>","</tbody></table>"],td:[3,"<table><tbody><tr>","</tr></tbody></table>"],_default:[0,"",""]};ga.optgroup=ga.option,ga.tbody=ga.tfoot=ga.colgroup=ga.caption=ga.thead,ga.th=ga.td;function ha(a,b){var c="undefined"!=typeof a.getElementsByTagName?a.getElementsByTagName(b||"*"):"undefined"!=typeof a.querySelectorAll?a.querySelectorAll(b||"*"):[];return void 0===b||b&&o.nodeName(a,b)?o.merge([a],c):c}function ia(a,b){for(var c=0,d=a.length;d>c;c++)R.set(a[c],"globalEval",!b||R.get(b[c],"globalEval"))}var ja=/<|&#?\w+;/;function ka(a,b,c,d,e){for(var f,g,h,i,j,k,l=b.createDocumentFragment(),m=[],n=0,p=a.length;p>n;n++)if(f=a[n],f||0===f)if("object"===o.type(f))o.merge(m,f.nodeType?[f]:f);else if(ja.test(f)){g=g||l.appendChild(b.createElement("div")),h=(ea.exec(f)||["",""])[1].toLowerCase(),i=ga[h]||ga._default,g.innerHTML=i[1]+o.htmlPrefilter(f)+i[2],k=i[0];while(k--)g=g.lastChild;o.merge(m,g.childNodes),g=l.firstChild,g.textContent=""}else m.push(b.createTextNode(f));l.textContent="",n=0;while(f=m[n++])if(d&&o.inArray(f,d)>-1)e&&e.push(f);else if(j=o.contains(f.ownerDocument,f),g=ha(l.appendChild(f),"script"),j&&ia(g),c){k=0;while(f=g[k++])fa.test(f.type||"")&&c.push(f)}return l}!function(){var a=d.createDocumentFragment(),b=a.appendChild(d.createElement("div")),c=d.createElement("input");c.setAttribute("type","radio"),c.setAttribute("checked","checked"),c.setAttribute("name","t"),b.appendChild(c),l.checkClone=b.cloneNode(!0).cloneNode(!0).lastChild.checked,b.innerHTML="<textarea>x</textarea>",l.noCloneChecked=!!b.cloneNode(!0).lastChild.defaultValue}();var la=/^key/,ma=/^(?:mouse|pointer|contextmenu|drag|drop)|click/,na=/^([^.]*)(?:\.(.+)|)/;function oa(){return!0}function pa(){return!1}function qa(){try{return d.activeElement}catch(a){}}function ra(a,b,c,d,e,f){var g,h;if("object"==typeof b){"string"!=typeof c&&(d=d||c,c=void 0);for(h in b)ra(a,h,c,d,b[h],f);return a}return null==d&&null==e?(e=c,d=c=void 0):null==e&&("string"==typeof c?(e=d,d=void 0):(e=d,d=c,c=void 0)),e===!1&&(e=pa),1===f&&(g=e,e=function(a){return o().off(a),g.apply(this,arguments)},e.guid=g.guid||(g.guid=o.guid++)),a.each(function(){o.event.add(this,b,e,d,c)})}o.event={global:{},add:function(a,b,c,d,e){var f,g,h,i,j,k,l,m,n,p,q,r=R.get(a);if(r){c.handler&&(f=c,c=f.handler,e=f.selector),c.guid||(c.guid=o.guid++),(i=r.events)||(i=r.events={}),(g=r.handle)||(g=r.handle=function(b){return"undefined"!=typeof o&&o.event.triggered!==b.type?o.event.dispatch.apply(a,arguments):void 0}),b=(b||"").match(H)||[""],j=b.length;while(j--)h=na.exec(b[j])||[],n=q=h[1],p=(h[2]||"").split(".").sort(),n&&(l=o.event.special[n]||{},n=(e?l.delegateType:l.bindType)||n,l=o.event.special[n]||{},k=o.extend({type:n,origType:q,data:d,handler:c,guid:c.guid,selector:e,needsContext:e&&o.expr.match.needsContext.test(e),namespace:p.join(".")},f),(m=i[n])||(m=i[n]=[],m.delegateCount=0,l.setup&&l.setup.call(a,d,p,g)!==!1||a.addEventListener&&a.addEventListener(n,g)),l.add&&(l.add.call(a,k),k.handler.guid||(k.handler.guid=c.guid)),e?m.splice(m.delegateCount++,0,k):m.push(k),o.event.global[n]=!0)}},remove:function(a,b,c,d,e){var f,g,h,i,j,k,l,m,n,p,q,r=R.hasData(a)&&R.get(a);if(r&&(i=r.events)){b=(b||"").match(H)||[""],j=b.length;while(j--)if(h=na.exec(b[j])||[],n=q=h[1],p=(h[2]||"").split(".").sort(),n){l=o.event.special[n]||{},n=(d?l.delegateType:l.bindType)||n,m=i[n]||[],h=h[2]&&new RegExp("(^|\\.)"+p.join("\\.(?:.*\\.|)")+"(\\.|$)"),g=f=m.length;while(f--)k=m[f],!e&&q!==k.origType||c&&c.guid!==k.guid||h&&!h.test(k.namespace)||d&&d!==k.selector&&("**"!==d||!k.selector)||(m.splice(f,1),k.selector&&m.delegateCount--,l.remove&&l.remove.call(a,k));g&&!m.length&&(l.teardown&&l.teardown.call(a,p,r.handle)!==!1||o.removeEvent(a,n,r.handle),delete i[n])}else for(n in i)o.event.remove(a,n+b[j],c,d,!0);o.isEmptyObject(i)&&R.remove(a,"handle events")}},dispatch:function(a){a=o.event.fix(a);var b,c,d,f,g,h=[],i=e.call(arguments),j=(R.get(this,"events")||{})[a.type]||[],k=o.event.special[a.type]||{};if(i[0]=a,a.delegateTarget=this,!k.preDispatch||k.preDispatch.call(this,a)!==!1){h=o.event.handlers.call(this,a,j),b=0;while((f=h[b++])&&!a.isPropagationStopped()){a.currentTarget=f.elem,c=0;while((g=f.handlers[c++])&&!a.isImmediatePropagationStopped())(!a.rnamespace||a.rnamespace.test(g.namespace))&&(a.handleObj=g,a.data=g.data,d=((o.event.special[g.origType]||{}).handle||g.handler).apply(f.elem,i),void 0!==d&&(a.result=d)===!1&&(a.preventDefault(),a.stopPropagation()))}return k.postDispatch&&k.postDispatch.call(this,a),a.result}},handlers:function(a,b){var c,d,e,f,g=[],h=b.delegateCount,i=a.target;if(h&&i.nodeType&&("click"!==a.type||isNaN(a.button)||a.button<1))for(;i!==this;i=i.parentNode||this)if(1===i.nodeType&&(i.disabled!==!0||"click"!==a.type)){for(d=[],c=0;h>c;c++)f=b[c],e=f.selector+" ",void 0===d[e]&&(d[e]=f.needsContext?o(e,this).index(i)>-1:o.find(e,this,null,[i]).length),d[e]&&d.push(f);d.length&&g.push({elem:i,handlers:d})}return h<b.length&&g.push({elem:this,handlers:b.slice(h)}),g},props:"altKey bubbles cancelable ctrlKey currentTarget detail eventPhase metaKey relatedTarget shiftKey target timeStamp view which".split(" "),fixHooks:{},keyHooks:{props:"char charCode key keyCode".split(" "),filter:function(a,b){return null==a.which&&(a.which=null!=b.charCode?b.charCode:b.keyCode),a}},mouseHooks:{props:"button buttons clientX clientY offsetX offsetY pageX pageY screenX screenY toElement".split(" "),filter:function(a,b){var c,e,f,g=b.button;return null==a.pageX&&null!=b.clientX&&(c=a.target.ownerDocument||d,e=c.documentElement,f=c.body,a.pageX=b.clientX+(e&&e.scrollLeft||f&&f.scrollLeft||0)-(e&&e.clientLeft||f&&f.clientLeft||0),a.pageY=b.clientY+(e&&e.scrollTop||f&&f.scrollTop||0)-(e&&e.clientTop||f&&f.clientTop||0)),a.which||void 0===g||(a.which=1&g?1:2&g?3:4&g?2:0),a}},fix:function(a){if(a[o.expando])return a;var b,c,d,e=a.type,f=a,g=this.fixHooks[e];g||(this.fixHooks[e]=g=ma.test(e)?this.mouseHooks:la.test(e)?this.keyHooks:{}),d=g.props?this.props.concat(g.props):this.props,a=new o.Event(f),b=d.length;while(b--)c=d[b],a[c]=f[c];return 3===a.target.nodeType&&(a.target=a.target.parentNode),g.filter?g.filter(a,f):a},special:{load:{noBubble:!0},focus:{trigger:function(){return this!==qa()&&this.focus?(this.focus(),!1):void 0},delegateType:"focusin"},blur:{trigger:function(){return this===qa()&&this.blur?(this.blur(),!1):void 0},delegateType:"focusout"},click:{trigger:function(){return"checkbox"===this.type&&this.click&&o.nodeName(this,"input")?(this.click(),!1):void 0},_default:function(a){return o.nodeName(a.target,"a")}},beforeunload:{postDispatch:function(a){void 0!==a.result&&a.originalEvent&&(a.originalEvent.returnValue=a.result)}}}},o.removeEvent=function(a,b,c){a.removeEventListener&&a.removeEventListener(b,c)},o.Event=function(a,b){return this instanceof o.Event?(a&&a.type?(this.originalEvent=a,this.type=a.type,this.isDefaultPrevented=a.defaultPrevented||void 0===a.defaultPrevented&&a.returnValue===!1?oa:pa):this.type=a,b&&o.extend(this,b),this.timeStamp=a&&a.timeStamp||o.now(),void(this[o.expando]=!0)):new o.Event(a,b)},o.Event.prototype={constructor:o.Event,isDefaultPrevented:pa,isPropagationStopped:pa,isImmediatePropagationStopped:pa,preventDefault:function(){var a=this.originalEvent;this.isDefaultPrevented=oa,a&&a.preventDefault()},stopPropagation:function(){var a=this.originalEvent;this.isPropagationStopped=oa,a&&a.stopPropagation()},stopImmediatePropagation:function(){var a=this.originalEvent;this.isImmediatePropagationStopped=oa,a&&a.stopImmediatePropagation(),this.stopPropagation()}},o.each({mouseenter:"mouseover",mouseleave:"mouseout",pointerenter:"pointerover",pointerleave:"pointerout"},function(a,b){o.event.special[a]={delegateType:b,bindType:b,handle:function(a){var c,d=this,e=a.relatedTarget,f=a.handleObj;return(!e||e!==d&&!o.contains(d,e))&&(a.type=f.origType,c=f.handler.apply(this,arguments),a.type=b),c}}}),o.fn.extend({on:function(a,b,c,d){return ra(this,a,b,c,d)},one:function(a,b,c,d){return ra(this,a,b,c,d,1)},off:function(a,b,c){var d,e;if(a&&a.preventDefault&&a.handleObj)return d=a.handleObj,o(a.delegateTarget).off(d.namespace?d.origType+"."+d.namespace:d.origType,d.selector,d.handler),this;if("object"==typeof a){for(e in a)this.off(e,b,a[e]);return this}return(b===!1||"function"==typeof b)&&(c=b,b=void 0),c===!1&&(c=pa),this.each(function(){o.event.remove(this,a,c,b)})}});var sa=/<(?!area|br|col|embed|hr|img|input|link|meta|param)(([a-z][^\/\0>\x20\t\r\n\f]*)[^>]*)\/>/gi,ta=/<script|<style|<link/i,ua=/checked\s*(?:[^=]|=\s*.checked.)/i,va=/^true\/(.*)/,wa=/^\s*<!(?:\[CDATA\[|--)|(?:\]\]|--)>\s*$/g;function xa(a,b){return o.nodeName(a,"table")&&o.nodeName(11!==b.nodeType?b:b.firstChild,"tr")?a.getElementsByTagName("tbody")[0]||a:a}function ya(a){return a.type=(null!==a.getAttribute("type"))+"/"+a.type,a}function za(a){var b=va.exec(a.type);return b?a.type=b[1]:a.removeAttribute("type"),a}function Aa(a,b){var c,d,e,f,g,h,i,j;if(1===b.nodeType){if(R.hasData(a)&&(f=R.access(a),g=R.set(b,f),j=f.events)){delete g.handle,g.events={};for(e in j)for(c=0,d=j[e].length;d>c;c++)o.event.add(b,e,j[e][c])}S.hasData(a)&&(h=S.access(a),i=o.extend({},h),S.set(b,i))}}function Ba(a,b){var c=b.nodeName.toLowerCase();"input"===c&&da.test(a.type)?b.checked=a.checked:("input"===c||"textarea"===c)&&(b.defaultValue=a.defaultValue)}function Ca(a,b,c,d){b=f.apply([],b);var e,g,h,i,j,k,n=0,p=a.length,q=p-1,r=b[0],s=o.isFunction(r);if(s||p>1&&"string"==typeof r&&!l.checkClone&&ua.test(r))return a.each(function(e){var f=a.eq(e);s&&(b[0]=r.call(this,e,f.html())),Ca(f,b,c,d)});if(p&&(e=ka(b,a[0].ownerDocument,!1,a,d),g=e.firstChild,1===e.childNodes.length&&(e=g),g||d)){for(h=o.map(ha(e,"script"),ya),i=h.length;p>n;n++)j=e,n!==q&&(j=o.clone(j,!0,!0),i&&o.merge(h,ha(j,"script"))),c.call(a[n],j,n);if(i)for(k=h[h.length-1].ownerDocument,o.map(h,za),n=0;i>n;n++)j=h[n],fa.test(j.type||"")&&!R.access(j,"globalEval")&&o.contains(k,j)&&(j.src?o._evalUrl&&o._evalUrl(j.src):m(j.textContent.replace(wa,""),k))}return a}function Da(a,b,c){for(var d,e=b?o.filter(b,a):a,f=0;null!=(d=e[f]);f++)c||1!==d.nodeType||o.cleanData(ha(d)),d.parentNode&&(c&&o.contains(d.ownerDocument,d)&&ia(ha(d,"script")),d.parentNode.removeChild(d));return a}o.extend({htmlPrefilter:function(a){return a.replace(sa,"<$1></$2>")},clone:function(a,b,c){var d,e,f,g,h=a.cloneNode(!0),i=o.contains(a.ownerDocument,a);if(!(l.noCloneChecked||1!==a.nodeType&&11!==a.nodeType||o.isXMLDoc(a)))for(g=ha(h),f=ha(a),d=0,e=f.length;e>d;d++)Ba(f[d],g[d]);if(b)if(c)for(f=f||ha(a),g=g||ha(h),d=0,e=f.length;e>d;d++)Aa(f[d],g[d]);else Aa(a,h);return g=ha(h,"script"),g.length>0&&ia(g,!i&&ha(a,"script")),h},cleanData:function(a){for(var b,c,d,e=o.event.special,f=0;void 0!==(c=a[f]);f++)if(P(c)){if(b=c[R.expando]){if(b.events)for(d in b.events)e[d]?o.event.remove(c,d):o.removeEvent(c,d,b.handle);c[R.expando]=void 0}c[S.expando]&&(c[S.expando]=void 0)}}}),o.fn.extend({detach:function(a){return Da(this,a,!0)},remove:function(a){return Da(this,a)},text:function(a){return O(this,function(a){return void 0===a?o.text(this):this.empty().each(function(){(1===this.nodeType||11===this.nodeType||9===this.nodeType)&&(this.textContent=a)})},null,a,arguments.length)},append:function(){return Ca(this,arguments,function(a){if(1===this.nodeType||11===this.nodeType||9===this.nodeType){var b=xa(this,a);b.appendChild(a)}})},prepend:function(){return Ca(this,arguments,function(a){if(1===this.nodeType||11===this.nodeType||9===this.nodeType){var b=xa(this,a);b.insertBefore(a,b.firstChild)}})},before:function(){return Ca(this,arguments,function(a){this.parentNode&&this.parentNode.insertBefore(a,this)})},after:function(){return Ca(this,arguments,function(a){this.parentNode&&this.parentNode.insertBefore(a,this.nextSibling)})},empty:function(){for(var a,b=0;null!=(a=this[b]);b++)1===a.nodeType&&(o.cleanData(ha(a,!1)),a.textContent="");return this},clone:function(a,b){return a=null==a?!1:a,b=null==b?a:b,this.map(function(){return o.clone(this,a,b)})},html:function(a){return O(this,function(a){var b=this[0]||{},c=0,d=this.length;if(void 0===a&&1===b.nodeType)return b.innerHTML;if("string"==typeof a&&!ta.test(a)&&!ga[(ea.exec(a)||["",""])[1].toLowerCase()]){a=o.htmlPrefilter(a);try{for(;d>c;c++)b=this[c]||{},1===b.nodeType&&(o.cleanData(ha(b,!1)),b.innerHTML=a);b=0}catch(e){}}b&&this.empty().append(a)},null,a,arguments.length)},replaceWith:function(){var a=[];return Ca(this,arguments,function(b){var c=this.parentNode;o.inArray(this,a)<0&&(o.cleanData(ha(this)),c&&c.replaceChild(b,this))},a)}}),o.each({appendTo:"append",prependTo:"prepend",insertBefore:"before",insertAfter:"after",replaceAll:"replaceWith"},function(a,b){o.fn[a]=function(a){for(var c,d=[],e=o(a),f=e.length-1,h=0;f>=h;h++)c=h===f?this:this.clone(!0),o(e[h])[b](c),g.apply(d,c.get());return this.pushStack(d)}});var Ea=/^margin/,Fa=new RegExp("^("+W+")(?!px)[a-z%]+$","i"),Ga=function(b){var c=b.ownerDocument.defaultView;return c.opener||(c=a),c.getComputedStyle(b)},Ha=d.documentElement;!function(){var b,c,e,f,g=d.createElement("div"),h=d.createElement("div");if(h.style){h.style.backgroundClip="content-box",h.cloneNode(!0).style.backgroundClip="",l.clearCloneStyle="content-box"===h.style.backgroundClip,g.style.cssText="border:0;width:8px;height:0;top:0;left:-9999px;padding:0;margin-top:1px;position:absolute",g.appendChild(h);function i(){h.style.cssText="box-sizing:border-box;position:relative;display:block;margin:auto;border:1px;padding:1px;top:1%;width:50%",h.innerHTML="",Ha.appendChild(g);var d=a.getComputedStyle(h);b="1%"!==d.top,f="2px"===d.marginLeft,c="4px"===d.width,h.style.marginRight="50%",e="4px"===d.marginRight,Ha.removeChild(g)}o.extend(l,{pixelPosition:function(){return i(),b},boxSizingReliable:function(){return null==c&&i(),c},pixelMarginRight:function(){return null==c&&i(),e},reliableMarginLeft:function(){return null==c&&i(),f}})}}();function Ia(a,b,c){var d,e,f,g,h=a.style;return c=c||Ga(a),c&&(g=c.getPropertyValue(b)||c[b],""!==g||o.contains(a.ownerDocument,a)||(g=o.style(a,b)),!l.pixelMarginRight()&&Fa.test(g)&&Ea.test(b)&&(d=h.width,e=h.minWidth,f=h.maxWidth,h.minWidth=h.maxWidth=h.width=g,g=c.width,h.width=d,h.minWidth=e,h.maxWidth=f)),void 0!==g?g+"":g}function Ja(a,b){return{get:function(){return a()?void delete this.get:(this.get=b).apply(this,arguments)}}}var Ka=/^(none|table(?!-c[ea]).+)/,La={position:"absolute",visibility:"hidden",display:"block"},Ma={letterSpacing:"0",fontWeight:"400"},Na=["Webkit","Moz","ms"],Oa=d.createElement("div").style;function Pa(a){if(a in Oa)return a;var b=a[0].toUpperCase()+a.slice(1),c=Na.length;while(c--)if(a=Na[c]+b,a in Oa)return a}function Qa(a,b,c){var d=X.exec(b);return d?Math.max(0,d[2]-(c||0))+(d[3]||"px"):b}function Ra(a,b,c,d,e){for(var f=c===(d?"border":"content")?4:"width"===b?1:0,g=0;4>f;f+=2)"margin"===c&&(g+=o.css(a,c+Y[f],!0,e)),d?("content"===c&&(g-=o.css(a,"padding"+Y[f],!0,e)),"margin"!==c&&(g-=o.css(a,"border"+Y[f]+"Width",!0,e))):(g+=o.css(a,"padding"+Y[f],!0,e),"padding"!==c&&(g+=o.css(a,"border"+Y[f]+"Width",!0,e)));return g}function Sa(b,c,e){var f,g=!0,h=Ga(b),i="border-box"===o.css(b,"boxSizing",!1,h);if(b.getClientRects().length&&(f=b.getBoundingClientRect()[c]),d.msFullscreenElement&&a.top!==a&&(f*=100),0>=f||null==f){if(f=Ia(b,c,h),(0>f||null==f)&&(f=b.style[c]),Fa.test(f))return f;g=i&&(l.boxSizingReliable()||f===b.style[c]),f=parseFloat(f)||0}return f+Ra(b,c,e||(i?"border":"content"),g,h)+"px"}o.extend({cssHooks:{opacity:{get:function(a,b){if(b){var c=Ia(a,"opacity");return""===c?"1":c}}}},cssNumber:{animationIterationCount:!0,columnCount:!0,fillOpacity:!0,flexGrow:!0,flexShrink:!0,fontWeight:!0,lineHeight:!0,opacity:!0,order:!0,orphans:!0,widows:!0,zIndex:!0,zoom:!0},cssProps:{"float":"cssFloat"},style:function(a,b,c,d){if(a&&3!==a.nodeType&&8!==a.nodeType&&a.style){var e,f,g,h=o.camelCase(b),i=a.style;return b=o.cssProps[h]||(o.cssProps[h]=Pa(h)||h),g=o.cssHooks[b]||o.cssHooks[h],void 0===c?g&&"get"in g&&void 0!==(e=g.get(a,!1,d))?e:i[b]:(f=typeof c,"string"===f&&(e=X.exec(c))&&e[1]&&(c=_(a,b,e),f="number"),null!=c&&c===c&&("number"===f&&(c+=e&&e[3]||(o.cssNumber[h]?"":"px")),l.clearCloneStyle||""!==c||0!==b.indexOf("background")||(i[b]="inherit"),g&&"set"in g&&void 0===(c=g.set(a,c,d))||(i[b]=c)),void 0)}},css:function(a,b,c,d){var e,f,g,h=o.camelCase(b);return b=o.cssProps[h]||(o.cssProps[h]=Pa(h)||h),g=o.cssHooks[b]||o.cssHooks[h],g&&"get"in g&&(e=g.get(a,!0,c)),void 0===e&&(e=Ia(a,b,d)),"normal"===e&&b in Ma&&(e=Ma[b]),""===c||c?(f=parseFloat(e),c===!0||isFinite(f)?f||0:e):e}}),o.each(["height","width"],function(a,b){o.cssHooks[b]={get:function(a,c,d){return c?!Ka.test(o.css(a,"display"))||a.getClientRects().length&&a.getBoundingClientRect().width?Sa(a,b,d):$(a,La,function(){return Sa(a,b,d)}):void 0},set:function(a,c,d){var e,f=d&&Ga(a),g=d&&Ra(a,b,d,"border-box"===o.css(a,"boxSizing",!1,f),f);return g&&(e=X.exec(c))&&"px"!==(e[3]||"px")&&(a.style[b]=c,c=o.css(a,b)),Qa(a,c,g)}}}),o.cssHooks.marginLeft=Ja(l.reliableMarginLeft,function(a,b){return b?(parseFloat(Ia(a,"marginLeft"))||a.getBoundingClientRect().left-$(a,{marginLeft:0},function(){return a.getBoundingClientRect().left}))+"px":void 0}),o.each({margin:"",padding:"",border:"Width"},function(a,b){o.cssHooks[a+b]={expand:function(c){for(var d=0,e={},f="string"==typeof c?c.split(" "):[c];4>d;d++)e[a+Y[d]+b]=f[d]||f[d-2]||f[0];return e}},Ea.test(a)||(o.cssHooks[a+b].set=Qa)}),o.fn.extend({css:function(a,b){return O(this,function(a,b,c){var d,e,f={},g=0;if(o.isArray(b)){for(d=Ga(a),e=b.length;e>g;g++)f[b[g]]=o.css(a,b[g],!1,d);return f}return void 0!==c?o.style(a,b,c):o.css(a,b)},a,b,arguments.length>1)}});function Ta(a,b,c,d,e){return new Ta.prototype.init(a,b,c,d,e)}o.Tween=Ta,Ta.prototype={constructor:Ta,init:function(a,b,c,d,e,f){this.elem=a,this.prop=c,this.easing=e||o.easing._default,this.options=b,this.start=this.now=this.cur(),this.end=d,this.unit=f||(o.cssNumber[c]?"":"px")},cur:function(){var a=Ta.propHooks[this.prop];return a&&a.get?a.get(this):Ta.propHooks._default.get(this)},run:function(a){var b=Ta.propHooks[this.prop];return this.pos=this.options.duration?o.easing[this.easing](a):a,this.now=(this.end-this.start)*this.pos+this.start,this.options.step&&this.options.step.call(this.elem,this.now,this),b&&b.set?b.set(this):Ta.propHooks._default.set(this),this}},Ta.prototype.init.prototype=Ta.prototype,Ta.propHooks={_default:{get:function(a){var b;return 1!==a.elem.nodeType||null!=a.elem[a.prop]&&null==a.elem.style[a.prop]?a.elem[a.prop]:(b=o.css(a.elem,a.prop,""),b&&"auto"!==b?b:0)},set:function(a){o.fx.step[a.prop]?o.fx.step[a.prop](a):1!==a.elem.nodeType||null==a.elem.style[o.cssProps[a.prop]]&&!o.cssHooks[a.prop]?a.elem[a.prop]=a.now:o.style(a.elem,a.prop,a.now+a.unit)}}},Ta.propHooks.scrollTop=Ta.propHooks.scrollLeft={set:function(a){a.elem.nodeType&&a.elem.parentNode&&(a.elem[a.prop]=a.now)}},o.easing={linear:function(a){return a},swing:function(a){return.5-Math.cos(a*Math.PI)/2},_default:"swing"},o.fx=Ta.prototype.init,o.fx.step={};var Ua,Va,Wa=/^(?:toggle|show|hide)$/,Xa=/queueHooks$/;function Ya(){Va&&(a.requestAnimationFrame(Ya),o.fx.tick())}function Za(){return a.setTimeout(function(){Ua=void 0}),Ua=o.now()}function $a(a,b){var c,d=0,e={height:a};for(b=b?1:0;4>d;d+=2-b)c=Y[d],e["margin"+c]=e["padding"+c]=a;return b&&(e.opacity=e.width=a),e}function _a(a,b,c){for(var d,e=(cb.tweeners[b]||[]).concat(cb.tweeners["*"]),f=0,g=e.length;g>f;f++)if(d=e[f].call(c,b,a))return d}function ab(a,b,c){var d,e,f,g,h,i,j,k,l="width"in b||"height"in b,m=this,n={},p=a.style,q=a.nodeType&&Z(a),r=R.get(a,"fxshow");c.queue||(g=o._queueHooks(a,"fx"),null==g.unqueued&&(g.unqueued=0,h=g.empty.fire,g.empty.fire=function(){g.unqueued||h()}),g.unqueued++,m.always(function(){m.always(function(){g.unqueued--,o.queue(a,"fx").length||g.empty.fire()})}));for(d in b)if(e=b[d],Wa.test(e)){if(delete b[d],f=f||"toggle"===e,e===(q?"hide":"show")){if("show"!==e||!r||void 0===r[d])continue;q=!0}n[d]=r&&r[d]||o.style(a,d)}if(i=!o.isEmptyObject(b),i||!o.isEmptyObject(n)){l&&1===a.nodeType&&(c.overflow=[p.overflow,p.overflowX,p.overflowY],j=r&&r.display,null==j&&(j=R.get(a,"display")),k=o.css(a,"display"),"none"===k&&(j?k=j:(ca([a],!0),j=a.style.display||j,k=o.css(a,"display"),ca([a]))),("inline"===k||"inline-block"===k&&null!=j)&&"none"===o.css(a,"float")&&(i||(m.done(function(){p.display=j}),null==j&&(k=p.display,j="none"===k?"":k)),p.display="inline-block")),c.overflow&&(p.overflow="hidden",m.always(function(){p.overflow=c.overflow[0],p.overflowX=c.overflow[1],p.overflowY=c.overflow[2]})),i=!1;for(d in n)i||(r?"hidden"in r&&(q=r.hidden):r=R.access(a,"fxshow",{display:j}),f&&(r.hidden=!q),q&&ca([a],!0),m.done(function(){q||ca([a]),R.remove(a,"fxshow");for(d in n)o.style(a,d,n[d])})),i=_a(q?r[d]:0,d,m),d in r||(r[d]=i.start,q&&(i.end=i.start,i.start="width"===d||"height"===d?1:0))}}function bb(a,b){var c,d,e,f,g;for(c in a)if(d=o.camelCase(c),e=b[d],f=a[c],o.isArray(f)&&(e=f[1],f=a[c]=f[0]),c!==d&&(a[d]=f,delete a[c]),g=o.cssHooks[d],g&&"expand"in g){f=g.expand(f),delete a[d];for(c in f)c in a||(a[c]=f[c],b[c]=e)}else b[d]=e}function cb(a,b,c){var d,e,f=0,g=cb.prefilters.length,h=o.Deferred().always(function(){delete i.elem}),i=function(){if(e)return!1;for(var b=Ua||Za(),c=Math.max(0,j.startTime+j.duration-b),d=c/j.duration||0,f=1-d,g=0,i=j.tweens.length;i>g;g++)j.tweens[g].run(f);return h.notifyWith(a,[j,f,c]),1>f&&i?c:(h.resolveWith(a,[j]),!1)},j=h.promise({elem:a,props:o.extend({},b),opts:o.extend(!0,{specialEasing:{},easing:o.easing._default},c),originalProperties:b,originalOptions:c,startTime:Ua||Za(),duration:c.duration,tweens:[],createTween:function(b,c){var d=o.Tween(a,j.opts,b,c,j.opts.specialEasing[b]||j.opts.easing);return j.tweens.push(d),d},stop:function(b){var c=0,d=b?j.tweens.length:0;if(e)return this;for(e=!0;d>c;c++)j.tweens[c].run(1);return b?(h.notifyWith(a,[j,1,0]),h.resolveWith(a,[j,b])):h.rejectWith(a,[j,b]),this}}),k=j.props;for(bb(k,j.opts.specialEasing);g>f;f++)if(d=cb.prefilters[f].call(j,a,k,j.opts))return o.isFunction(d.stop)&&(o._queueHooks(j.elem,j.opts.queue).stop=o.proxy(d.stop,d)),d;return o.map(k,_a,j),o.isFunction(j.opts.start)&&j.opts.start.call(a,j),o.fx.timer(o.extend(i,{elem:a,anim:j,queue:j.opts.queue})),j.progress(j.opts.progress).done(j.opts.done,j.opts.complete).fail(j.opts.fail).always(j.opts.always)}o.Animation=o.extend(cb,{tweeners:{"*":[function(a,b){var c=this.createTween(a,b);return _(c.elem,a,X.exec(b),c),c}]},tweener:function(a,b){o.isFunction(a)?(b=a,a=["*"]):a=a.match(H);for(var c,d=0,e=a.length;e>d;d++)c=a[d],cb.tweeners[c]=cb.tweeners[c]||[],cb.tweeners[c].unshift(b)},prefilters:[ab],prefilter:function(a,b){b?cb.prefilters.unshift(a):cb.prefilters.push(a)}}),o.speed=function(a,b,c){var e=a&&"object"==typeof a?o.extend({},a):{complete:c||!c&&b||o.isFunction(a)&&a,duration:a,easing:c&&b||b&&!o.isFunction(b)&&b};return o.fx.off||d.hidden?e.duration=0:e.duration="number"==typeof e.duration?e.duration:e.duration in o.fx.speeds?o.fx.speeds[e.duration]:o.fx.speeds._default,(null==e.queue||e.queue===!0)&&(e.queue="fx"),e.old=e.complete,e.complete=function(){o.isFunction(e.old)&&e.old.call(this),e.queue&&o.dequeue(this,e.queue)},e},o.fn.extend({fadeTo:function(a,b,c,d){return this.filter(Z).css("opacity",0).show().end().animate({opacity:b},a,c,d)},animate:function(a,b,c,d){var e=o.isEmptyObject(a),f=o.speed(b,c,d),g=function(){var b=cb(this,o.extend({},a),f);(e||R.get(this,"finish"))&&b.stop(!0)};return g.finish=g,e||f.queue===!1?this.each(g):this.queue(f.queue,g)},stop:function(a,b,c){var d=function(a){var b=a.stop;delete a.stop,b(c)};return"string"!=typeof a&&(c=b,b=a,a=void 0),b&&a!==!1&&this.queue(a||"fx",[]),this.each(function(){var b=!0,e=null!=a&&a+"queueHooks",f=o.timers,g=R.get(this);if(e)g[e]&&g[e].stop&&d(g[e]);else for(e in g)g[e]&&g[e].stop&&Xa.test(e)&&d(g[e]);for(e=f.length;e--;)f[e].elem!==this||null!=a&&f[e].queue!==a||(f[e].anim.stop(c),b=!1,f.splice(e,1));(b||!c)&&o.dequeue(this,a)})},finish:function(a){return a!==!1&&(a=a||"fx"),this.each(function(){var b,c=R.get(this),d=c[a+"queue"],e=c[a+"queueHooks"],f=o.timers,g=d?d.length:0;for(c.finish=!0,o.queue(this,a,[]),e&&e.stop&&e.stop.call(this,!0),b=f.length;b--;)f[b].elem===this&&f[b].queue===a&&(f[b].anim.stop(!0),f.splice(b,1));for(b=0;g>b;b++)d[b]&&d[b].finish&&d[b].finish.call(this);delete c.finish})}}),o.each(["toggle","show","hide"],function(a,b){var c=o.fn[b];o.fn[b]=function(a,d,e){return null==a||"boolean"==typeof a?c.apply(this,arguments):this.animate($a(b,!0),a,d,e)}}),o.each({slideDown:$a("show"),slideUp:$a("hide"),slideToggle:$a("toggle"),fadeIn:{opacity:"show"},fadeOut:{opacity:"hide"},fadeToggle:{opacity:"toggle"}},function(a,b){o.fn[a]=function(a,c,d){return this.animate(b,a,c,d)}}),o.timers=[],o.fx.tick=function(){var a,b=0,c=o.timers;for(Ua=o.now();b<c.length;b++)a=c[b],a()||c[b]!==a||c.splice(b--,1);c.length||o.fx.stop(),Ua=void 0},o.fx.timer=function(a){o.timers.push(a),a()?o.fx.start():o.timers.pop()},o.fx.interval=13,o.fx.start=function(){Va||(Va=a.requestAnimationFrame?a.requestAnimationFrame(Ya):a.setInterval(o.fx.tick,o.fx.interval))},o.fx.stop=function(){a.cancelAnimationFrame?a.cancelAnimationFrame(Va):a.clearInterval(Va),Va=null},o.fx.speeds={slow:600,fast:200,_default:400},o.fn.delay=function(b,c){return b=o.fx?o.fx.speeds[b]||b:b,c=c||"fx",this.queue(c,function(c,d){var e=a.setTimeout(c,b);d.stop=function(){a.clearTimeout(e)}})},function(){var a=d.createElement("input"),b=d.createElement("select"),c=b.appendChild(d.createElement("option"));a.type="checkbox",l.checkOn=""!==a.value,l.optSelected=c.selected,a=d.createElement("input"),a.value="t",a.type="radio",l.radioValue="t"===a.value}();var db,eb=o.expr.attrHandle,fb=/[A-Z]+/g,gb=function(a){return a.toLowerCase()};o.fn.extend({attr:function(a,b){return O(this,o.attr,a,b,arguments.length>1)},removeAttr:function(a){return this.each(function(){o.removeAttr(this,a)})}}),o.extend({attr:function(a,b,c){var d,e,f=a.nodeType;if(3!==f&&8!==f&&2!==f)return"undefined"==typeof a.getAttribute?o.prop(a,b,c):(1===f&&o.isXMLDoc(a)||(b=b.replace(fb,gb),e=o.attrHooks[b]||(o.expr.match.bool.test(b)?db:void 0)),void 0!==c?null===c?void o.removeAttr(a,b):e&&"set"in e&&void 0!==(d=e.set(a,c,b))?d:(a.setAttribute(b,c+""),c):e&&"get"in e&&null!==(d=e.get(a,b))?d:(d=o.find.attr(a,b),null==d?void 0:d))},attrHooks:{type:{set:function(a,b){if(!l.radioValue&&"radio"===b&&o.nodeName(a,"input")){var c=a.value;return a.setAttribute("type",b),c&&(a.value=c),b}}}},removeAttr:function(a,b){var c,d=0,e=b&&b.match(H);if(e&&1===a.nodeType)while(c=e[d++])a.removeAttribute(c)}}),db={set:function(a,b,c){return b===!1?o.removeAttr(a,c):a.setAttribute(c,c),c}},o.each(o.expr.match.bool.source.match(/\w+/g),function(a,b){
var c=eb[b]||o.find.attr;eb[b]=function(a,b,d){var e,f;return d||(f=eb[b],eb[b]=e,e=null!=c(a,b,d)?b.toLowerCase():null,eb[b]=f),e}});var hb=/^(?:input|select|textarea|button)$/i,ib=/^(?:a|area)$/i;o.fn.extend({prop:function(a,b){return O(this,o.prop,a,b,arguments.length>1)},removeProp:function(a){return this.each(function(){delete this[o.propFix[a]||a]})}}),o.extend({prop:function(a,b,c){var d,e,f=a.nodeType;if(3!==f&&8!==f&&2!==f)return 1===f&&o.isXMLDoc(a)||(b=o.propFix[b]||b,e=o.propHooks[b]),void 0!==c?e&&"set"in e&&void 0!==(d=e.set(a,c,b))?d:a[b]=c:e&&"get"in e&&null!==(d=e.get(a,b))?d:a[b]},propHooks:{tabIndex:{get:function(a){var b=o.find.attr(a,"tabindex");return b?parseInt(b,10):hb.test(a.nodeName)||ib.test(a.nodeName)&&a.href?0:-1}}},propFix:{"for":"htmlFor","class":"className"}}),l.optSelected||(o.propHooks.selected={get:function(a){var b=a.parentNode;return b&&b.parentNode&&b.parentNode.selectedIndex,null}}),o.each(["tabIndex","readOnly","maxLength","cellSpacing","cellPadding","rowSpan","colSpan","useMap","frameBorder","contentEditable"],function(){o.propFix[this.toLowerCase()]=this});var jb=/[\t\r\n\f]/g;function kb(a){return a.getAttribute&&a.getAttribute("class")||""}o.fn.extend({addClass:function(a){var b,c,d,e,f,g,h,i=0;if(o.isFunction(a))return this.each(function(b){o(this).addClass(a.call(this,b,kb(this)))});if("string"==typeof a&&a){b=a.match(H)||[];while(c=this[i++])if(e=kb(c),d=1===c.nodeType&&(" "+e+" ").replace(jb," ")){g=0;while(f=b[g++])d.indexOf(" "+f+" ")<0&&(d+=f+" ");h=o.trim(d),e!==h&&c.setAttribute("class",h)}}return this},removeClass:function(a){var b,c,d,e,f,g,h,i=0;if(o.isFunction(a))return this.each(function(b){o(this).removeClass(a.call(this,b,kb(this)))});if(!arguments.length)return this.attr("class","");if("string"==typeof a&&a){b=a.match(H)||[];while(c=this[i++])if(e=kb(c),d=1===c.nodeType&&(" "+e+" ").replace(jb," ")){g=0;while(f=b[g++])while(d.indexOf(" "+f+" ")>-1)d=d.replace(" "+f+" "," ");h=o.trim(d),e!==h&&c.setAttribute("class",h)}}return this},toggleClass:function(a,b){var c=typeof a;return"boolean"==typeof b&&"string"===c?b?this.addClass(a):this.removeClass(a):o.isFunction(a)?this.each(function(c){o(this).toggleClass(a.call(this,c,kb(this),b),b)}):this.each(function(){var b,d,e,f;if("string"===c){d=0,e=o(this),f=a.match(H)||[];while(b=f[d++])e.hasClass(b)?e.removeClass(b):e.addClass(b)}else(void 0===a||"boolean"===c)&&(b=kb(this),b&&R.set(this,"__className__",b),this.setAttribute&&this.setAttribute("class",b||a===!1?"":R.get(this,"__className__")||""))})},hasClass:function(a){var b,c,d=0;b=" "+a+" ";while(c=this[d++])if(1===c.nodeType&&(" "+kb(c)+" ").replace(jb," ").indexOf(b)>-1)return!0;return!1}});var lb=/\r/g;o.fn.extend({val:function(a){var b,c,d,e=this[0];{if(arguments.length)return d=o.isFunction(a),this.each(function(c){var e;1===this.nodeType&&(e=d?a.call(this,c,o(this).val()):a,null==e?e="":"number"==typeof e?e+="":o.isArray(e)&&(e=o.map(e,function(a){return null==a?"":a+""})),b=o.valHooks[this.type]||o.valHooks[this.nodeName.toLowerCase()],b&&"set"in b&&void 0!==b.set(this,e,"value")||(this.value=e))});if(e)return b=o.valHooks[e.type]||o.valHooks[e.nodeName.toLowerCase()],b&&"get"in b&&void 0!==(c=b.get(e,"value"))?c:(c=e.value,"string"==typeof c?c.replace(lb,""):null==c?"":c)}}}),o.extend({valHooks:{option:{get:function(a){return o.trim(a.value)}},select:{get:function(a){for(var b,c,d=a.options,e=a.selectedIndex,f="select-one"===a.type,g=f?null:[],h=f?e+1:d.length,i=0>e?h:f?e:0;h>i;i++)if(c=d[i],(c.selected||i===e)&&!c.disabled&&(!c.parentNode.disabled||!o.nodeName(c.parentNode,"optgroup"))){if(b=o(c).val(),f)return b;g.push(b)}return g},set:function(a,b){var c,d,e=a.options,f=o.makeArray(b),g=e.length;while(g--)d=e[g],(d.selected=o.inArray(o.valHooks.option.get(d),f)>-1)&&(c=!0);return c||(a.selectedIndex=-1),f}}}}),o.each(["radio","checkbox"],function(){o.valHooks[this]={set:function(a,b){return o.isArray(b)?a.checked=o.inArray(o(a).val(),b)>-1:void 0}},l.checkOn||(o.valHooks[this].get=function(a){return null===a.getAttribute("value")?"on":a.value})});var mb=/^(?:focusinfocus|focusoutblur)$/;o.extend(o.event,{trigger:function(b,c,e,f){var g,h,i,j,l,m,n,p=[e||d],q=k.call(b,"type")?b.type:b,r=k.call(b,"namespace")?b.namespace.split("."):[];if(h=i=e=e||d,3!==e.nodeType&&8!==e.nodeType&&!mb.test(q+o.event.triggered)&&(q.indexOf(".")>-1&&(r=q.split("."),q=r.shift(),r.sort()),l=q.indexOf(":")<0&&"on"+q,b=b[o.expando]?b:new o.Event(q,"object"==typeof b&&b),b.isTrigger=f?2:3,b.namespace=r.join("."),b.rnamespace=b.namespace?new RegExp("(^|\\.)"+r.join("\\.(?:.*\\.|)")+"(\\.|$)"):null,b.result=void 0,b.target||(b.target=e),c=null==c?[b]:o.makeArray(c,[b]),n=o.event.special[q]||{},f||!n.trigger||n.trigger.apply(e,c)!==!1)){if(!f&&!n.noBubble&&!o.isWindow(e)){for(j=n.delegateType||q,mb.test(j+q)||(h=h.parentNode);h;h=h.parentNode)p.push(h),i=h;i===(e.ownerDocument||d)&&p.push(i.defaultView||i.parentWindow||a)}g=0;while((h=p[g++])&&!b.isPropagationStopped())b.type=g>1?j:n.bindType||q,m=(R.get(h,"events")||{})[b.type]&&R.get(h,"handle"),m&&m.apply(h,c),m=l&&h[l],m&&m.apply&&P(h)&&(b.result=m.apply(h,c),b.result===!1&&b.preventDefault());return b.type=q,f||b.isDefaultPrevented()||n._default&&n._default.apply(p.pop(),c)!==!1||!P(e)||l&&o.isFunction(e[q])&&!o.isWindow(e)&&(i=e[l],i&&(e[l]=null),o.event.triggered=q,e[q](),o.event.triggered=void 0,i&&(e[l]=i)),b.result}},simulate:function(a,b,c){var d=o.extend(new o.Event,c,{type:a,isSimulated:!0});o.event.trigger(d,null,b),d.isDefaultPrevented()&&c.preventDefault()}}),o.fn.extend({trigger:function(a,b){return this.each(function(){o.event.trigger(a,b,this)})},triggerHandler:function(a,b){var c=this[0];return c?o.event.trigger(a,b,c,!0):void 0}}),o.each("blur focus focusin focusout resize scroll click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup contextmenu".split(" "),function(a,b){o.fn[b]=function(a,c){return arguments.length>0?this.on(b,null,a,c):this.trigger(b)}}),o.fn.extend({hover:function(a,b){return this.mouseenter(a).mouseleave(b||a)}}),l.focusin="onfocusin"in a,l.focusin||o.each({focus:"focusin",blur:"focusout"},function(a,b){var c=function(a){o.event.simulate(b,a.target,o.event.fix(a))};o.event.special[b]={setup:function(){var d=this.ownerDocument||this,e=R.access(d,b);e||d.addEventListener(a,c,!0),R.access(d,b,(e||0)+1)},teardown:function(){var d=this.ownerDocument||this,e=R.access(d,b)-1;e?R.access(d,b,e):(d.removeEventListener(a,c,!0),R.remove(d,b))}}});var nb=a.location,ob=o.now(),pb=/\?/;o.parseJSON=JSON.parse,o.parseXML=function(b){var c;if(!b||"string"!=typeof b)return null;try{c=(new a.DOMParser).parseFromString(b,"text/xml")}catch(d){c=void 0}return(!c||c.getElementsByTagName("parsererror").length)&&o.error("Invalid XML: "+b),c};var qb=/%20/g,rb=/#.*$/,sb=/([?&])_=[^&]*/,tb=/^(.*?):[ \t]*([^\r\n]*)$/gm,ub=/^(?:about|app|app-storage|.+-extension|file|res|widget):$/,vb=/^(?:GET|HEAD)$/,wb=/^\/\//,xb={},yb={},zb="*/".concat("*"),Ab=d.createElement("a");Ab.href=nb.href;function Bb(a){return function(b,c){"string"!=typeof b&&(c=b,b="*");var d,e=0,f=b.toLowerCase().match(H)||[];if(o.isFunction(c))while(d=f[e++])"+"===d[0]?(d=d.slice(1)||"*",(a[d]=a[d]||[]).unshift(c)):(a[d]=a[d]||[]).push(c)}}function Cb(a,b,c,d){var e={},f=a===yb;function g(h){var i;return e[h]=!0,o.each(a[h]||[],function(a,h){var j=h(b,c,d);return"string"!=typeof j||f||e[j]?f?!(i=j):void 0:(b.dataTypes.unshift(j),g(j),!1)}),i}return g(b.dataTypes[0])||!e["*"]&&g("*")}function Db(a,b){var c,d,e=o.ajaxSettings.flatOptions||{};for(c in b)void 0!==b[c]&&((e[c]?a:d||(d={}))[c]=b[c]);return d&&o.extend(!0,a,d),a}function Eb(a,b,c){var d,e,f,g,h=a.contents,i=a.dataTypes;while("*"===i[0])i.shift(),void 0===d&&(d=a.mimeType||b.getResponseHeader("Content-Type"));if(d)for(e in h)if(h[e]&&h[e].test(d)){i.unshift(e);break}if(i[0]in c)f=i[0];else{for(e in c){if(!i[0]||a.converters[e+" "+i[0]]){f=e;break}g||(g=e)}f=f||g}return f?(f!==i[0]&&i.unshift(f),c[f]):void 0}function Fb(a,b,c,d){var e,f,g,h,i,j={},k=a.dataTypes.slice();if(k[1])for(g in a.converters)j[g.toLowerCase()]=a.converters[g];f=k.shift();while(f)if(a.responseFields[f]&&(c[a.responseFields[f]]=b),!i&&d&&a.dataFilter&&(b=a.dataFilter(b,a.dataType)),i=f,f=k.shift())if("*"===f)f=i;else if("*"!==i&&i!==f){if(g=j[i+" "+f]||j["* "+f],!g)for(e in j)if(h=e.split(" "),h[1]===f&&(g=j[i+" "+h[0]]||j["* "+h[0]])){g===!0?g=j[e]:j[e]!==!0&&(f=h[0],k.unshift(h[1]));break}if(g!==!0)if(g&&a["throws"])b=g(b);else try{b=g(b)}catch(l){return{state:"parsererror",error:g?l:"No conversion from "+i+" to "+f}}}return{state:"success",data:b}}o.extend({active:0,lastModified:{},etag:{},ajaxSettings:{url:nb.href,type:"GET",isLocal:ub.test(nb.protocol),global:!0,processData:!0,async:!0,contentType:"application/x-www-form-urlencoded; charset=UTF-8",accepts:{"*":zb,text:"text/plain",html:"text/html",xml:"application/xml, text/xml",json:"application/json, text/javascript"},contents:{xml:/\bxml\b/,html:/\bhtml/,json:/\bjson\b/},responseFields:{xml:"responseXML",text:"responseText",json:"responseJSON"},converters:{"* text":String,"text html":!0,"text json":o.parseJSON,"text xml":o.parseXML},flatOptions:{url:!0,context:!0}},ajaxSetup:function(a,b){return b?Db(Db(a,o.ajaxSettings),b):Db(o.ajaxSettings,a)},ajaxPrefilter:Bb(xb),ajaxTransport:Bb(yb),ajax:function(b,c){"object"==typeof b&&(c=b,b=void 0),c=c||{};var e,f,g,h,i,j,k,l,m,n,p=o.ajaxSetup({},c),q=p.context||p,r=p.context&&(q.nodeType||q.jquery)?o(q):o.event,s=o.Deferred(),t=o.Callbacks("once memory"),u=p.statusCode||{},v={},w={},x="canceled",y={readyState:0,getResponseHeader:function(a){var b;if(k){if(!h){h={};while(b=tb.exec(g))h[b[1].toLowerCase()]=b[2]}b=h[a.toLowerCase()]}return null==b?null:b},getAllResponseHeaders:function(){return k?g:null},setRequestHeader:function(a,b){return null==k&&(a=w[a.toLowerCase()]=w[a.toLowerCase()]||a,v[a]=b),this},overrideMimeType:function(a){return null==k&&(p.mimeType=a),this},statusCode:function(a){var b;if(a)if(k)y.always(a[y.status]);else for(b in a)u[b]=[u[b],a[b]];return this},abort:function(a){var b=a||x;return e&&e.abort(b),A(0,b),this}};if(s.promise(y),p.url=((b||p.url||nb.href)+"").replace(wb,nb.protocol+"//"),p.type=c.method||c.type||p.method||p.type,p.dataTypes=o.trim(p.dataType||"*").toLowerCase().match(H)||[""],null==p.crossDomain){j=d.createElement("a");try{j.href=p.url,j.href=j.href,p.crossDomain=Ab.protocol+"//"+Ab.host!=j.protocol+"//"+j.host}catch(z){p.crossDomain=!0}}if(p.data&&p.processData&&"string"!=typeof p.data&&(p.data=o.param(p.data,p.traditional)),Cb(xb,p,c,y),k)return y;l=o.event&&p.global,l&&0===o.active++&&o.event.trigger("ajaxStart"),p.type=p.type.toUpperCase(),p.hasContent=!vb.test(p.type),f=p.url.replace(rb,""),p.hasContent?p.data&&p.processData&&0===(p.contentType||"").indexOf("application/x-www-form-urlencoded")&&(p.data=p.data.replace(qb,"+")):(n=p.url.slice(f.length),p.data&&(f+=(pb.test(f)?"&":"?")+p.data,delete p.data),p.cache===!1&&(f=f.replace(sb,""),n=(pb.test(f)?"&":"?")+"_="+ob++ +n),p.url=f+n),p.ifModified&&(o.lastModified[f]&&y.setRequestHeader("If-Modified-Since",o.lastModified[f]),o.etag[f]&&y.setRequestHeader("If-None-Match",o.etag[f])),(p.data&&p.hasContent&&p.contentType!==!1||c.contentType)&&y.setRequestHeader("Content-Type",p.contentType),y.setRequestHeader("Accept",p.dataTypes[0]&&p.accepts[p.dataTypes[0]]?p.accepts[p.dataTypes[0]]+("*"!==p.dataTypes[0]?", "+zb+"; q=0.01":""):p.accepts["*"]);for(m in p.headers)y.setRequestHeader(m,p.headers[m]);if(p.beforeSend&&(p.beforeSend.call(q,y,p)===!1||k))return y.abort();if(x="abort",t.add(p.complete),y.done(p.success),y.fail(p.error),e=Cb(yb,p,c,y)){if(y.readyState=1,l&&r.trigger("ajaxSend",[y,p]),k)return y;p.async&&p.timeout>0&&(i=a.setTimeout(function(){y.abort("timeout")},p.timeout));try{k=!1,e.send(v,A)}catch(z){if(k)throw z;A(-1,z)}}else A(-1,"No Transport");function A(b,c,d,h){var j,m,n,v,w,x=c;k||(k=!0,i&&a.clearTimeout(i),e=void 0,g=h||"",y.readyState=b>0?4:0,j=b>=200&&300>b||304===b,d&&(v=Eb(p,y,d)),v=Fb(p,v,y,j),j?(p.ifModified&&(w=y.getResponseHeader("Last-Modified"),w&&(o.lastModified[f]=w),w=y.getResponseHeader("etag"),w&&(o.etag[f]=w)),204===b||"HEAD"===p.type?x="nocontent":304===b?x="notmodified":(x=v.state,m=v.data,n=v.error,j=!n)):(n=x,(b||!x)&&(x="error",0>b&&(b=0))),y.status=b,y.statusText=(c||x)+"",j?s.resolveWith(q,[m,x,y]):s.rejectWith(q,[y,x,n]),y.statusCode(u),u=void 0,l&&r.trigger(j?"ajaxSuccess":"ajaxError",[y,p,j?m:n]),t.fireWith(q,[y,x]),l&&(r.trigger("ajaxComplete",[y,p]),--o.active||o.event.trigger("ajaxStop")))}return y},getJSON:function(a,b,c){return o.get(a,b,c,"json")},getScript:function(a,b){return o.get(a,void 0,b,"script")}}),o.each(["get","post"],function(a,b){o[b]=function(a,c,d,e){return o.isFunction(c)&&(e=e||d,d=c,c=void 0),o.ajax(o.extend({url:a,type:b,dataType:e,data:c,success:d},o.isPlainObject(a)&&a))}}),o._evalUrl=function(a){return o.ajax({url:a,type:"GET",dataType:"script",cache:!0,async:!1,global:!1,"throws":!0})},o.fn.extend({wrapAll:function(a){var b;return this[0]&&(o.isFunction(a)&&(a=a.call(this[0])),b=o(a,this[0].ownerDocument).eq(0).clone(!0),this[0].parentNode&&b.insertBefore(this[0]),b.map(function(){var a=this;while(a.firstElementChild)a=a.firstElementChild;return a}).append(this)),this},wrapInner:function(a){return o.isFunction(a)?this.each(function(b){o(this).wrapInner(a.call(this,b))}):this.each(function(){var b=o(this),c=b.contents();c.length?c.wrapAll(a):b.append(a)})},wrap:function(a){var b=o.isFunction(a);return this.each(function(c){o(this).wrapAll(b?a.call(this,c):a)})},unwrap:function(a){return this.parent(a).not("body").each(function(){o(this).replaceWith(this.childNodes)}),this}}),o.expr.filters.hidden=function(a){return!o.expr.filters.visible(a)},o.expr.filters.visible=function(a){return!!(a.offsetWidth||a.offsetHeight||a.getClientRects().length)};var Gb=/\[\]$/,Hb=/\r?\n/g,Ib=/^(?:submit|button|image|reset|file)$/i,Jb=/^(?:input|select|textarea|keygen)/i;function Kb(a,b,c,d){var e;if(o.isArray(b))o.each(b,function(b,e){c||Gb.test(a)?d(a,e):Kb(a+"["+("object"==typeof e&&null!=e?b:"")+"]",e,c,d)});else if(c||"object"!==o.type(b))d(a,b);else for(e in b)Kb(a+"["+e+"]",b[e],c,d)}o.param=function(a,b){var c,d=[],e=function(a,b){b=o.isFunction(b)?b():null==b?"":b,d[d.length]=encodeURIComponent(a)+"="+encodeURIComponent(b)};if(void 0===b&&(b=o.ajaxSettings&&o.ajaxSettings.traditional),o.isArray(a)||a.jquery&&!o.isPlainObject(a))o.each(a,function(){e(this.name,this.value)});else for(c in a)Kb(c,a[c],b,e);return d.join("&")},o.fn.extend({serialize:function(){return o.param(this.serializeArray())},serializeArray:function(){return this.map(function(){var a=o.prop(this,"elements");return a?o.makeArray(a):this}).filter(function(){var a=this.type;return this.name&&!o(this).is(":disabled")&&Jb.test(this.nodeName)&&!Ib.test(a)&&(this.checked||!da.test(a))}).map(function(a,b){var c=o(this).val();return null==c?null:o.isArray(c)?o.map(c,function(a){return{name:b.name,value:a.replace(Hb,"\r\n")}}):{name:b.name,value:c.replace(Hb,"\r\n")}}).get()}}),o.ajaxSettings.xhr=function(){try{return new a.XMLHttpRequest}catch(b){}};var Lb={0:200,1223:204},Mb=o.ajaxSettings.xhr();l.cors=!!Mb&&"withCredentials"in Mb,l.ajax=Mb=!!Mb,o.ajaxTransport(function(b){var c,d;return l.cors||Mb&&!b.crossDomain?{send:function(e,f){var g,h=b.xhr();if(h.open(b.type,b.url,b.async,b.username,b.password),b.xhrFields)for(g in b.xhrFields)h[g]=b.xhrFields[g];b.mimeType&&h.overrideMimeType&&h.overrideMimeType(b.mimeType),b.crossDomain||e["X-Requested-With"]||(e["X-Requested-With"]="XMLHttpRequest");for(g in e)h.setRequestHeader(g,e[g]);c=function(a){return function(){c&&(c=d=h.onload=h.onerror=h.onabort=h.onreadystatechange=null,"abort"===a?h.abort():"error"===a?"number"!=typeof h.status?f(0,"error"):f(h.status,h.statusText):f(Lb[h.status]||h.status,h.statusText,"text"!==(h.responseType||"text")||"string"!=typeof h.responseText?{binary:h.response}:{text:h.responseText},h.getAllResponseHeaders()))}},h.onload=c(),d=h.onerror=c("error"),void 0!==h.onabort?h.onabort=d:h.onreadystatechange=function(){4===h.readyState&&a.setTimeout(function(){c&&d()})},c=c("abort");try{h.send(b.hasContent&&b.data||null)}catch(i){if(c)throw i}},abort:function(){c&&c()}}:void 0}),o.ajaxPrefilter(function(a){a.crossDomain&&(a.contents.script=!1)}),o.ajaxSetup({accepts:{script:"text/javascript, application/javascript, application/ecmascript, application/x-ecmascript"},contents:{script:/\b(?:java|ecma)script\b/},converters:{"text script":function(a){return o.globalEval(a),a}}}),o.ajaxPrefilter("script",function(a){void 0===a.cache&&(a.cache=!1),a.crossDomain&&(a.type="GET")}),o.ajaxTransport("script",function(a){if(a.crossDomain){var b,c;return{send:function(e,f){b=o("<script>").prop({charset:a.scriptCharset,src:a.url}).on("load error",c=function(a){b.remove(),c=null,a&&f("error"===a.type?404:200,a.type)}),d.head.appendChild(b[0])},abort:function(){c&&c()}}}});var Nb=[],Ob=/(=)\?(?=&|$)|\?\?/;o.ajaxSetup({jsonp:"callback",jsonpCallback:function(){var a=Nb.pop()||o.expando+"_"+ob++;return this[a]=!0,a}}),o.ajaxPrefilter("json jsonp",function(b,c,d){var e,f,g,h=b.jsonp!==!1&&(Ob.test(b.url)?"url":"string"==typeof b.data&&0===(b.contentType||"").indexOf("application/x-www-form-urlencoded")&&Ob.test(b.data)&&"data");return h||"jsonp"===b.dataTypes[0]?(e=b.jsonpCallback=o.isFunction(b.jsonpCallback)?b.jsonpCallback():b.jsonpCallback,h?b[h]=b[h].replace(Ob,"$1"+e):b.jsonp!==!1&&(b.url+=(pb.test(b.url)?"&":"?")+b.jsonp+"="+e),b.converters["script json"]=function(){return g||o.error(e+" was not called"),g[0]},b.dataTypes[0]="json",f=a[e],a[e]=function(){g=arguments},d.always(function(){void 0===f?o(a).removeProp(e):a[e]=f,b[e]&&(b.jsonpCallback=c.jsonpCallback,Nb.push(e)),g&&o.isFunction(f)&&f(g[0]),g=f=void 0}),"script"):void 0}),l.createHTMLDocument=function(){var a=d.implementation.createHTMLDocument("").body;return a.innerHTML="<form></form><form></form>",2===a.childNodes.length}(),o.parseHTML=function(a,b,c){if("string"!=typeof a)return[];"boolean"==typeof b&&(c=b,b=!1),b=b||(l.createHTMLDocument?d.implementation.createHTMLDocument(""):d);var e=y.exec(a),f=!c&&[];return e?[b.createElement(e[1])]:(e=ka([a],b,f),f&&f.length&&o(f).remove(),o.merge([],e.childNodes))},o.fn.load=function(a,b,c){var d,e,f,g=this,h=a.indexOf(" ");return h>-1&&(d=o.trim(a.slice(h)),a=a.slice(0,h)),o.isFunction(b)?(c=b,b=void 0):b&&"object"==typeof b&&(e="POST"),g.length>0&&o.ajax({url:a,type:e||"GET",dataType:"html",data:b}).done(function(a){f=arguments,g.html(d?o("<div>").append(o.parseHTML(a)).find(d):a)}).always(c&&function(a,b){g.each(function(){c.apply(g,f||[a.responseText,b,a])})}),this},o.each(["ajaxStart","ajaxStop","ajaxComplete","ajaxError","ajaxSuccess","ajaxSend"],function(a,b){o.fn[b]=function(a){return this.on(b,a)}}),o.expr.filters.animated=function(a){return o.grep(o.timers,function(b){return a===b.elem}).length};function Pb(a){return o.isWindow(a)?a:9===a.nodeType&&a.defaultView}o.offset={setOffset:function(a,b,c){var d,e,f,g,h,i,j,k=o.css(a,"position"),l=o(a),m={};"static"===k&&(a.style.position="relative"),h=l.offset(),f=o.css(a,"top"),i=o.css(a,"left"),j=("absolute"===k||"fixed"===k)&&(f+i).indexOf("auto")>-1,j?(d=l.position(),g=d.top,e=d.left):(g=parseFloat(f)||0,e=parseFloat(i)||0),o.isFunction(b)&&(b=b.call(a,c,o.extend({},h))),null!=b.top&&(m.top=b.top-h.top+g),null!=b.left&&(m.left=b.left-h.left+e),"using"in b?b.using.call(a,m):l.css(m)}},o.fn.extend({offset:function(a){if(arguments.length)return void 0===a?this:this.each(function(b){o.offset.setOffset(this,a,b)});var b,c,d,e,f=this[0];if(f)return f.getClientRects().length?(d=f.getBoundingClientRect(),d.width||d.height?(e=f.ownerDocument,c=Pb(e),b=e.documentElement,{top:d.top+c.pageYOffset-b.clientTop,left:d.left+c.pageXOffset-b.clientLeft}):d):{top:0,left:0}},position:function(){if(this[0]){var a,b,c=this[0],d={top:0,left:0};return"fixed"===o.css(c,"position")?b=c.getBoundingClientRect():(a=this.offsetParent(),b=this.offset(),o.nodeName(a[0],"html")||(d=a.offset()),d.top+=o.css(a[0],"borderTopWidth",!0)-a.scrollTop(),d.left+=o.css(a[0],"borderLeftWidth",!0)-a.scrollLeft()),{top:b.top-d.top-o.css(c,"marginTop",!0),left:b.left-d.left-o.css(c,"marginLeft",!0)}}},offsetParent:function(){return this.map(function(){var a=this.offsetParent;while(a&&"static"===o.css(a,"position"))a=a.offsetParent;return a||Ha})}}),o.each({scrollLeft:"pageXOffset",scrollTop:"pageYOffset"},function(a,b){var c="pageYOffset"===b;o.fn[a]=function(d){return O(this,function(a,d,e){var f=Pb(a);return void 0===e?f?f[b]:a[d]:void(f?f.scrollTo(c?f.pageXOffset:e,c?e:f.pageYOffset):a[d]=e)},a,d,arguments.length)}}),o.each(["top","left"],function(a,b){o.cssHooks[b]=Ja(l.pixelPosition,function(a,c){return c?(c=Ia(a,b),Fa.test(c)?o(a).position()[b]+"px":c):void 0})}),o.each({Height:"height",Width:"width"},function(a,b){o.each({padding:"inner"+a,content:b,"":"outer"+a},function(c,d){o.fn[d]=function(e,f){var g=arguments.length&&(c||"boolean"!=typeof e),h=c||(e===!0||f===!0?"margin":"border");return O(this,function(b,c,e){var f;return o.isWindow(b)?0===d.indexOf("outer")?b["inner"+a]:b.document.documentElement["client"+a]:9===b.nodeType?(f=b.documentElement,Math.max(b.body["scroll"+a],f["scroll"+a],b.body["offset"+a],f["offset"+a],f["client"+a])):void 0===e?o.css(b,c,h):o.style(b,c,e,h)},b,g?e:void 0,g)}})}),o.fn.extend({bind:function(a,b,c){return this.on(a,null,b,c)},unbind:function(a,b){return this.off(a,null,b)},delegate:function(a,b,c,d){return this.on(b,a,c,d)},undelegate:function(a,b,c){return 1===arguments.length?this.off(a,"**"):this.off(b,a||"**",c)}}),"function"==typeof define&&define.amd&&define("jquery",[],function(){return o});var Qb=a.jQuery,Rb=a.$;return o.noConflict=function(b){return a.$===o&&(a.$=Rb),b&&a.jQuery===o&&(a.jQuery=Qb),o},b||(a.jQuery=a.$=o),o});
(function($,undefined){"use strict";if($.rails!==undefined){$.error("jquery-ujs has already been loaded!")}var rails;var $document=$(document);$.rails=rails={linkClickSelector:"a[data-confirm], a[data-method], a[data-remote]:not([disabled]), a[data-disable-with], a[data-disable]",buttonClickSelector:"button[data-remote]:not([form]):not(form button), button[data-confirm]:not([form]):not(form button)",inputChangeSelector:"select[data-remote], input[data-remote], textarea[data-remote]",formSubmitSelector:"form",formInputClickSelector:"form input[type=submit], form input[type=image], form button[type=submit], form button:not([type]), input[type=submit][form], input[type=image][form], button[type=submit][form], button[form]:not([type])",disableSelector:"input[data-disable-with]:enabled, button[data-disable-with]:enabled, textarea[data-disable-with]:enabled, input[data-disable]:enabled, button[data-disable]:enabled, textarea[data-disable]:enabled",enableSelector:"input[data-disable-with]:disabled, button[data-disable-with]:disabled, textarea[data-disable-with]:disabled, input[data-disable]:disabled, button[data-disable]:disabled, textarea[data-disable]:disabled",requiredInputSelector:"input[name][required]:not([disabled]), textarea[name][required]:not([disabled])",fileInputSelector:"input[type=file]:not([disabled])",linkDisableSelector:"a[data-disable-with], a[data-disable]",buttonDisableSelector:"button[data-remote][data-disable-with], button[data-remote][data-disable]",csrfToken:function(){return $("meta[name=csrf-token]").attr("content")},csrfParam:function(){return $("meta[name=csrf-param]").attr("content")},CSRFProtection:function(xhr){var token=rails.csrfToken();if(token)xhr.setRequestHeader("X-CSRF-Token",token)},refreshCSRFTokens:function(){$('form input[name="'+rails.csrfParam()+'"]').val(rails.csrfToken())},fire:function(obj,name,data){var event=$.Event(name);obj.trigger(event,data);return event.result!==false},confirm:function(message){return confirm(message)},ajax:function(options){return $.ajax(options)},href:function(element){return element[0].href},isRemote:function(element){return element.data("remote")!==undefined&&element.data("remote")!==false},handleRemote:function(element){var method,url,data,withCredentials,dataType,options;if(rails.fire(element,"ajax:before")){withCredentials=element.data("with-credentials")||null;dataType=element.data("type")||$.ajaxSettings&&$.ajaxSettings.dataType;if(element.is("form")){method=element.data("ujs:submit-button-formmethod")||element.attr("method");url=element.data("ujs:submit-button-formaction")||element.attr("action");data=$(element[0]).serializeArray();var button=element.data("ujs:submit-button");if(button){data.push(button);element.data("ujs:submit-button",null)}element.data("ujs:submit-button-formmethod",null);element.data("ujs:submit-button-formaction",null)}else if(element.is(rails.inputChangeSelector)){method=element.data("method");url=element.data("url");data=element.serialize();if(element.data("params"))data=data+"&"+element.data("params")}else if(element.is(rails.buttonClickSelector)){method=element.data("method")||"get";url=element.data("url");data=element.serialize();if(element.data("params"))data=data+"&"+element.data("params")}else{method=element.data("method");url=rails.href(element);data=element.data("params")||null}options={type:method||"GET",data:data,dataType:dataType,beforeSend:function(xhr,settings){if(settings.dataType===undefined){xhr.setRequestHeader("accept","*/*;q=0.5, "+settings.accepts.script)}if(rails.fire(element,"ajax:beforeSend",[xhr,settings])){element.trigger("ajax:send",xhr)}else{return false}},success:function(data,status,xhr){element.trigger("ajax:success",[data,status,xhr])},complete:function(xhr,status){element.trigger("ajax:complete",[xhr,status])},error:function(xhr,status,error){element.trigger("ajax:error",[xhr,status,error])},crossDomain:rails.isCrossDomain(url)};if(withCredentials){options.xhrFields={withCredentials:withCredentials}}if(url){options.url=url}return rails.ajax(options)}else{return false}},isCrossDomain:function(url){var originAnchor=document.createElement("a");originAnchor.href=location.href;var urlAnchor=document.createElement("a");try{urlAnchor.href=url;urlAnchor.href=urlAnchor.href;return!((!urlAnchor.protocol||urlAnchor.protocol===":")&&!urlAnchor.host||originAnchor.protocol+"//"+originAnchor.host===urlAnchor.protocol+"//"+urlAnchor.host)}catch(e){return true}},handleMethod:function(link){var href=rails.href(link),method=link.data("method"),target=link.attr("target"),csrfToken=rails.csrfToken(),csrfParam=rails.csrfParam(),form=$('<form method="post" action="'+href+'"></form>'),metadataInput='<input name="_method" value="'+method+'" type="hidden" />';if(csrfParam!==undefined&&csrfToken!==undefined&&!rails.isCrossDomain(href)){metadataInput+='<input name="'+csrfParam+'" value="'+csrfToken+'" type="hidden" />'}if(target){form.attr("target",target)}form.hide().append(metadataInput).appendTo("body");form.submit()},formElements:function(form,selector){return form.is("form")?$(form[0].elements).filter(selector):form.find(selector)},disableFormElements:function(form){rails.formElements(form,rails.disableSelector).each(function(){rails.disableFormElement($(this))})},disableFormElement:function(element){var method,replacement;method=element.is("button")?"html":"val";replacement=element.data("disable-with");if(replacement!==undefined){element.data("ujs:enable-with",element[method]());element[method](replacement)}element.prop("disabled",true);element.data("ujs:disabled",true)},enableFormElements:function(form){rails.formElements(form,rails.enableSelector).each(function(){rails.enableFormElement($(this))})},enableFormElement:function(element){var method=element.is("button")?"html":"val";if(element.data("ujs:enable-with")!==undefined){element[method](element.data("ujs:enable-with"));element.removeData("ujs:enable-with")}element.prop("disabled",false);element.removeData("ujs:disabled")},allowAction:function(element){var message=element.data("confirm"),answer=false,callback;if(!message){return true}if(rails.fire(element,"confirm")){try{answer=rails.confirm(message)}catch(e){(console.error||console.log).call(console,e.stack||e)}callback=rails.fire(element,"confirm:complete",[answer])}return answer&&callback},blankInputs:function(form,specifiedSelector,nonBlank){var foundInputs=$(),input,valueToCheck,radiosForNameWithNoneSelected,radioName,selector=specifiedSelector||"input,textarea",requiredInputs=form.find(selector),checkedRadioButtonNames={};requiredInputs.each(function(){input=$(this);if(input.is("input[type=radio]")){radioName=input.attr("name");if(!checkedRadioButtonNames[radioName]){if(form.find('input[type=radio]:checked[name="'+radioName+'"]').length===0){radiosForNameWithNoneSelected=form.find('input[type=radio][name="'+radioName+'"]');foundInputs=foundInputs.add(radiosForNameWithNoneSelected)}checkedRadioButtonNames[radioName]=radioName}}else{valueToCheck=input.is("input[type=checkbox],input[type=radio]")?input.is(":checked"):!!input.val();if(valueToCheck===nonBlank){foundInputs=foundInputs.add(input)}}});return foundInputs.length?foundInputs:false},nonBlankInputs:function(form,specifiedSelector){return rails.blankInputs(form,specifiedSelector,true)},stopEverything:function(e){$(e.target).trigger("ujs:everythingStopped");e.stopImmediatePropagation();return false},disableElement:function(element){var replacement=element.data("disable-with");if(replacement!==undefined){element.data("ujs:enable-with",element.html());element.html(replacement)}element.bind("click.railsDisable",function(e){return rails.stopEverything(e)});element.data("ujs:disabled",true)},enableElement:function(element){if(element.data("ujs:enable-with")!==undefined){element.html(element.data("ujs:enable-with"));element.removeData("ujs:enable-with")}element.unbind("click.railsDisable");element.removeData("ujs:disabled")}};if(rails.fire($document,"rails:attachBindings")){$.ajaxPrefilter(function(options,originalOptions,xhr){if(!options.crossDomain){rails.CSRFProtection(xhr)}});$(window).on("pageshow.rails",function(){$($.rails.enableSelector).each(function(){var element=$(this);if(element.data("ujs:disabled")){$.rails.enableFormElement(element)}});$($.rails.linkDisableSelector).each(function(){var element=$(this);if(element.data("ujs:disabled")){$.rails.enableElement(element)}})});$document.delegate(rails.linkDisableSelector,"ajax:complete",function(){rails.enableElement($(this))});$document.delegate(rails.buttonDisableSelector,"ajax:complete",function(){rails.enableFormElement($(this))});$document.delegate(rails.linkClickSelector,"click.rails",function(e){var link=$(this),method=link.data("method"),data=link.data("params"),metaClick=e.metaKey||e.ctrlKey;if(!rails.allowAction(link))return rails.stopEverything(e);if(!metaClick&&link.is(rails.linkDisableSelector))rails.disableElement(link);if(rails.isRemote(link)){if(metaClick&&(!method||method==="GET")&&!data){return true}var handleRemote=rails.handleRemote(link);if(handleRemote===false){rails.enableElement(link)}else{handleRemote.fail(function(){rails.enableElement(link)})}return false}else if(method){rails.handleMethod(link);return false}});$document.delegate(rails.buttonClickSelector,"click.rails",function(e){var button=$(this);if(!rails.allowAction(button)||!rails.isRemote(button))return rails.stopEverything(e);if(button.is(rails.buttonDisableSelector))rails.disableFormElement(button);var handleRemote=rails.handleRemote(button);if(handleRemote===false){rails.enableFormElement(button)}else{handleRemote.fail(function(){rails.enableFormElement(button)})}return false});$document.delegate(rails.inputChangeSelector,"change.rails",function(e){var link=$(this);if(!rails.allowAction(link)||!rails.isRemote(link))return rails.stopEverything(e);rails.handleRemote(link);return false});$document.delegate(rails.formSubmitSelector,"submit.rails",function(e){var form=$(this),remote=rails.isRemote(form),blankRequiredInputs,nonBlankFileInputs;if(!rails.allowAction(form))return rails.stopEverything(e);if(form.attr("novalidate")===undefined){if(form.data("ujs:formnovalidate-button")===undefined){blankRequiredInputs=rails.blankInputs(form,rails.requiredInputSelector,false);if(blankRequiredInputs&&rails.fire(form,"ajax:aborted:required",[blankRequiredInputs])){return rails.stopEverything(e)}}else{form.data("ujs:formnovalidate-button",undefined)}}if(remote){nonBlankFileInputs=rails.nonBlankInputs(form,rails.fileInputSelector);if(nonBlankFileInputs){setTimeout(function(){rails.disableFormElements(form)},13);var aborted=rails.fire(form,"ajax:aborted:file",[nonBlankFileInputs]);if(!aborted){setTimeout(function(){rails.enableFormElements(form)},13)}return aborted}rails.handleRemote(form);return false}else{setTimeout(function(){rails.disableFormElements(form)},13)}});$document.delegate(rails.formInputClickSelector,"click.rails",function(event){var button=$(this);if(!rails.allowAction(button))return rails.stopEverything(event);var name=button.attr("name"),data=name?{name:name,value:button.val()}:null;var form=button.closest("form");if(form.length===0){form=$("#"+button.attr("form"))}form.data("ujs:submit-button",data);form.data("ujs:formnovalidate-button",button.attr("formnovalidate"));form.data("ujs:submit-button-formaction",button.attr("formaction"));form.data("ujs:submit-button-formmethod",button.attr("formmethod"))});$document.delegate(rails.formSubmitSelector,"ajax:send.rails",function(event){if(this===event.target)rails.disableFormElements($(this))});$document.delegate(rails.formSubmitSelector,"ajax:complete.rails",function(event){if(this===event.target)rails.enableFormElements($(this))});$(function(){rails.refreshCSRFTokens()})}})(jQuery);
!function(e){e(["jquery"],function(e){return function(){function t(e,t,n){return g({type:O.error,iconClass:m().iconClasses.error,message:e,optionsOverride:n,title:t})}function n(t,n){return t||(t=m()),v=e("#"+t.containerId),v.length?v:(n&&(v=u(t)),v)}function i(e,t,n){return g({type:O.info,iconClass:m().iconClasses.info,message:e,optionsOverride:n,title:t})}function o(e){w=e}function s(e,t,n){return g({type:O.success,iconClass:m().iconClasses.success,message:e,optionsOverride:n,title:t})}function a(e,t,n){return g({type:O.warning,iconClass:m().iconClasses.warning,message:e,optionsOverride:n,title:t})}function r(e,t){var i=m();v||n(i),l(e,i,t)||d(i)}function c(t){var i=m();return v||n(i),t&&0===e(":focus",t).length?void h(t):void(v.children().length&&v.remove())}function d(t){for(var n=v.children(),i=n.length-1;i>=0;i--)l(e(n[i]),t)}function l(t,n,i){var o=i&&i.force?i.force:!1;return t&&(o||0===e(":focus",t).length)?(t[n.hideMethod]({duration:n.hideDuration,easing:n.hideEasing,complete:function(){h(t)}}),!0):!1}function u(t){return v=e("<div/>").attr("id",t.containerId).addClass(t.positionClass).attr("aria-live","polite").attr("role","alert"),v.appendTo(e(t.target)),v}function p(){return{tapToDismiss:!0,toastClass:"toast",containerId:"toast-container",debug:!1,showMethod:"fadeIn",showDuration:300,showEasing:"swing",onShown:void 0,hideMethod:"fadeOut",hideDuration:1e3,hideEasing:"swing",onHidden:void 0,closeMethod:!1,closeDuration:!1,closeEasing:!1,extendedTimeOut:1e3,iconClasses:{error:"toast-error",info:"toast-info",success:"toast-success",warning:"toast-warning"},iconClass:"toast-info",positionClass:"toast-top-right",timeOut:5e3,titleClass:"toast-title",messageClass:"toast-message",escapeHtml:!1,target:"body",closeHtml:'<button type="button">&times;</button>',newestOnTop:!0,preventDuplicates:!1,progressBar:!1}}function f(e){w&&w(e)}function g(t){function i(e){return null==e&&(e=""),new String(e).replace(/&/g,"&amp;").replace(/"/g,"&quot;").replace(/'/g,"&#39;").replace(/</g,"&lt;").replace(/>/g,"&gt;")}function o(){r(),d(),l(),u(),p(),c()}function s(){y.hover(b,O),!x.onclick&&x.tapToDismiss&&y.click(w),x.closeButton&&k&&k.click(function(e){e.stopPropagation?e.stopPropagation():void 0!==e.cancelBubble&&e.cancelBubble!==!0&&(e.cancelBubble=!0),w(!0)}),x.onclick&&y.click(function(e){x.onclick(e),w()})}function a(){y.hide(),y[x.showMethod]({duration:x.showDuration,easing:x.showEasing,complete:x.onShown}),x.timeOut>0&&(H=setTimeout(w,x.timeOut),q.maxHideTime=parseFloat(x.timeOut),q.hideEta=(new Date).getTime()+q.maxHideTime,x.progressBar&&(q.intervalId=setInterval(D,10)))}function r(){t.iconClass&&y.addClass(x.toastClass).addClass(E)}function c(){x.newestOnTop?v.prepend(y):v.append(y)}function d(){t.title&&(I.append(x.escapeHtml?i(t.title):t.title).addClass(x.titleClass),y.append(I))}function l(){t.message&&(M.append(x.escapeHtml?i(t.message):t.message).addClass(x.messageClass),y.append(M))}function u(){x.closeButton&&(k.addClass("toast-close-button").attr("role","button"),y.prepend(k))}function p(){x.progressBar&&(B.addClass("toast-progress"),y.prepend(B))}function g(e,t){if(e.preventDuplicates){if(t.message===C)return!0;C=t.message}return!1}function w(t){var n=t&&x.closeMethod!==!1?x.closeMethod:x.hideMethod,i=t&&x.closeDuration!==!1?x.closeDuration:x.hideDuration,o=t&&x.closeEasing!==!1?x.closeEasing:x.hideEasing;return!e(":focus",y).length||t?(clearTimeout(q.intervalId),y[n]({duration:i,easing:o,complete:function(){h(y),x.onHidden&&"hidden"!==j.state&&x.onHidden(),j.state="hidden",j.endTime=new Date,f(j)}})):void 0}function O(){(x.timeOut>0||x.extendedTimeOut>0)&&(H=setTimeout(w,x.extendedTimeOut),q.maxHideTime=parseFloat(x.extendedTimeOut),q.hideEta=(new Date).getTime()+q.maxHideTime)}function b(){clearTimeout(H),q.hideEta=0,y.stop(!0,!0)[x.showMethod]({duration:x.showDuration,easing:x.showEasing})}function D(){var e=(q.hideEta-(new Date).getTime())/q.maxHideTime*100;B.width(e+"%")}var x=m(),E=t.iconClass||x.iconClass;if("undefined"!=typeof t.optionsOverride&&(x=e.extend(x,t.optionsOverride),E=t.optionsOverride.iconClass||E),!g(x,t)){T++,v=n(x,!0);var H=null,y=e("<div/>"),I=e("<div/>"),M=e("<div/>"),B=e("<div/>"),k=e(x.closeHtml),q={intervalId:null,hideEta:null,maxHideTime:null},j={toastId:T,state:"visible",startTime:new Date,options:x,map:t};return o(),a(),s(),f(j),x.debug&&console&&console.log(j),y}}function m(){return e.extend({},p(),b.options)}function h(e){v||(v=n()),e.is(":visible")||(e.remove(),e=null,0===v.children().length&&(v.remove(),C=void 0))}var v,w,C,T=0,O={error:"error",info:"info",success:"success",warning:"warning"},b={clear:r,remove:c,error:t,getContainer:n,info:i,options:{},subscribe:o,success:s,version:"2.1.2",warning:a};return b}()})}("function"==typeof define&&define.amd?define:function(e,t){"undefined"!=typeof module&&module.exports?module.exports=t(require("jquery")):window.toastr=t(window.jQuery)});
//# sourceMappingURL=toastr.js.map
;
(function() {
  var CSRFToken, Click, ComponentUrl, EVENTS, Link, ProgressBar, browserIsntBuggy, browserSupportsCustomEvents, browserSupportsPushState, browserSupportsTurbolinks, bypassOnLoadPopstate, cacheCurrentPage, cacheSize, changePage, clone, constrainPageCacheTo, createDocument, crossOriginRedirect, currentState, enableProgressBar, enableTransitionCache, executeScriptTags, extractTitleAndBody, fetch, fetchHistory, fetchReplacement, historyStateIsDefined, initializeTurbolinks, installDocumentReadyPageEventTriggers, installHistoryChangeHandler, installJqueryAjaxSuccessPageUpdateTrigger, loadedAssets, manuallyTriggerHashChangeForFirefox, pageCache, pageChangePrevented, pagesCached, popCookie, processResponse, progressBar, recallScrollPosition, ref, referer, reflectNewUrl, reflectRedirectedUrl, rememberCurrentState, rememberCurrentUrl, rememberReferer, removeNoscriptTags, requestMethodIsSafe, resetScrollPosition, setAutofocusElement, transitionCacheEnabled, transitionCacheFor, triggerEvent, visit, xhr,
    indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; },
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty,
    slice = [].slice,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  pageCache = {};

  cacheSize = 10;

  transitionCacheEnabled = false;

  progressBar = null;

  currentState = null;

  loadedAssets = null;

  referer = null;

  xhr = null;

  EVENTS = {
    BEFORE_CHANGE: 'page:before-change',
    FETCH: 'page:fetch',
    RECEIVE: 'page:receive',
    CHANGE: 'page:change',
    UPDATE: 'page:update',
    LOAD: 'page:load',
    RESTORE: 'page:restore',
    BEFORE_UNLOAD: 'page:before-unload',
    EXPIRE: 'page:expire'
  };

  fetch = function(url) {
    var cachedPage;
    url = new ComponentUrl(url);
    rememberReferer();
    cacheCurrentPage();
    if (progressBar != null) {
      progressBar.start();
    }
    if (transitionCacheEnabled && (cachedPage = transitionCacheFor(url.absolute))) {
      fetchHistory(cachedPage);
      return fetchReplacement(url, null, false);
    } else {
      return fetchReplacement(url, resetScrollPosition);
    }
  };

  transitionCacheFor = function(url) {
    var cachedPage;
    cachedPage = pageCache[url];
    if (cachedPage && !cachedPage.transitionCacheDisabled) {
      return cachedPage;
    }
  };

  enableTransitionCache = function(enable) {
    if (enable == null) {
      enable = true;
    }
    return transitionCacheEnabled = enable;
  };

  enableProgressBar = function(enable) {
    if (enable == null) {
      enable = true;
    }
    if (!browserSupportsTurbolinks) {
      return;
    }
    if (enable) {
      return progressBar != null ? progressBar : progressBar = new ProgressBar('html');
    } else {
      if (progressBar != null) {
        progressBar.uninstall();
      }
      return progressBar = null;
    }
  };

  fetchReplacement = function(url, onLoadFunction, showProgressBar) {
    if (showProgressBar == null) {
      showProgressBar = true;
    }
    triggerEvent(EVENTS.FETCH, {
      url: url.absolute
    });
    if (xhr != null) {
      xhr.abort();
    }
    xhr = new XMLHttpRequest;
    xhr.open('GET', url.withoutHashForIE10compatibility(), true);
    xhr.setRequestHeader('Accept', 'text/html, application/xhtml+xml, application/xml');
    xhr.setRequestHeader('X-XHR-Referer', referer);
    xhr.onload = function() {
      var doc;
      triggerEvent(EVENTS.RECEIVE, {
        url: url.absolute
      });
      if (doc = processResponse()) {
        reflectNewUrl(url);
        reflectRedirectedUrl();
        changePage.apply(null, extractTitleAndBody(doc));
        manuallyTriggerHashChangeForFirefox();
        if (typeof onLoadFunction === "function") {
          onLoadFunction();
        }
        return triggerEvent(EVENTS.LOAD);
      } else {
        return document.location.href = crossOriginRedirect() || url.absolute;
      }
    };
    if (progressBar && showProgressBar) {
      xhr.onprogress = (function(_this) {
        return function(event) {
          var percent;
          percent = event.lengthComputable ? event.loaded / event.total * 100 : progressBar.value + (100 - progressBar.value) / 10;
          return progressBar.advanceTo(percent);
        };
      })(this);
    }
    xhr.onloadend = function() {
      return xhr = null;
    };
    xhr.onerror = function() {
      return document.location.href = url.absolute;
    };
    return xhr.send();
  };

  fetchHistory = function(cachedPage) {
    if (xhr != null) {
      xhr.abort();
    }
    changePage(cachedPage.title, cachedPage.body);
    recallScrollPosition(cachedPage);
    return triggerEvent(EVENTS.RESTORE);
  };

  cacheCurrentPage = function() {
    var currentStateUrl;
    currentStateUrl = new ComponentUrl(currentState.url);
    pageCache[currentStateUrl.absolute] = {
      url: currentStateUrl.relative,
      body: document.body,
      title: document.title,
      positionY: window.pageYOffset,
      positionX: window.pageXOffset,
      cachedAt: new Date().getTime(),
      transitionCacheDisabled: document.querySelector('[data-no-transition-cache]') != null
    };
    return constrainPageCacheTo(cacheSize);
  };

  pagesCached = function(size) {
    if (size == null) {
      size = cacheSize;
    }
    if (/^[\d]+$/.test(size)) {
      return cacheSize = parseInt(size);
    }
  };

  constrainPageCacheTo = function(limit) {
    var cacheTimesRecentFirst, i, key, len, pageCacheKeys, results;
    pageCacheKeys = Object.keys(pageCache);
    cacheTimesRecentFirst = pageCacheKeys.map(function(url) {
      return pageCache[url].cachedAt;
    }).sort(function(a, b) {
      return b - a;
    });
    results = [];
    for (i = 0, len = pageCacheKeys.length; i < len; i++) {
      key = pageCacheKeys[i];
      if (!(pageCache[key].cachedAt <= cacheTimesRecentFirst[limit])) {
        continue;
      }
      triggerEvent(EVENTS.EXPIRE, pageCache[key]);
      results.push(delete pageCache[key]);
    }
    return results;
  };

  changePage = function(title, body, csrfToken, runScripts) {
    triggerEvent(EVENTS.BEFORE_UNLOAD);
    document.title = title;
    document.documentElement.replaceChild(body, document.body);
    if (csrfToken != null) {
      CSRFToken.update(csrfToken);
    }
    setAutofocusElement();
    if (runScripts) {
      executeScriptTags();
    }
    currentState = window.history.state;
    if (progressBar != null) {
      progressBar.done();
    }
    triggerEvent(EVENTS.CHANGE);
    return triggerEvent(EVENTS.UPDATE);
  };

  executeScriptTags = function() {
    var attr, copy, i, j, len, len1, nextSibling, parentNode, ref, ref1, script, scripts;
    scripts = Array.prototype.slice.call(document.body.querySelectorAll('script:not([data-turbolinks-eval="false"])'));
    for (i = 0, len = scripts.length; i < len; i++) {
      script = scripts[i];
      if (!((ref = script.type) === '' || ref === 'text/javascript')) {
        continue;
      }
      copy = document.createElement('script');
      ref1 = script.attributes;
      for (j = 0, len1 = ref1.length; j < len1; j++) {
        attr = ref1[j];
        copy.setAttribute(attr.name, attr.value);
      }
      if (!script.hasAttribute('async')) {
        copy.async = false;
      }
      copy.appendChild(document.createTextNode(script.innerHTML));
      parentNode = script.parentNode, nextSibling = script.nextSibling;
      parentNode.removeChild(script);
      parentNode.insertBefore(copy, nextSibling);
    }
  };

  removeNoscriptTags = function(node) {
    node.innerHTML = node.innerHTML.replace(/<noscript[\S\s]*?<\/noscript>/ig, '');
    return node;
  };

  setAutofocusElement = function() {
    var autofocusElement, list;
    autofocusElement = (list = document.querySelectorAll('input[autofocus], textarea[autofocus]'))[list.length - 1];
    if (autofocusElement && document.activeElement !== autofocusElement) {
      return autofocusElement.focus();
    }
  };

  reflectNewUrl = function(url) {
    if ((url = new ComponentUrl(url)).absolute !== referer) {
      return window.history.pushState({
        turbolinks: true,
        url: url.absolute
      }, '', url.absolute);
    }
  };

  reflectRedirectedUrl = function() {
    var location, preservedHash;
    if (location = xhr.getResponseHeader('X-XHR-Redirected-To')) {
      location = new ComponentUrl(location);
      preservedHash = location.hasNoHash() ? document.location.hash : '';
      return window.history.replaceState(window.history.state, '', location.href + preservedHash);
    }
  };

  crossOriginRedirect = function() {
    var redirect;
    if (((redirect = xhr.getResponseHeader('Location')) != null) && (new ComponentUrl(redirect)).crossOrigin()) {
      return redirect;
    }
  };

  rememberReferer = function() {
    return referer = document.location.href;
  };

  rememberCurrentUrl = function() {
    return window.history.replaceState({
      turbolinks: true,
      url: document.location.href
    }, '', document.location.href);
  };

  rememberCurrentState = function() {
    return currentState = window.history.state;
  };

  manuallyTriggerHashChangeForFirefox = function() {
    var url;
    if (navigator.userAgent.match(/Firefox/) && !(url = new ComponentUrl).hasNoHash()) {
      window.history.replaceState(currentState, '', url.withoutHash());
      return document.location.hash = url.hash;
    }
  };

  recallScrollPosition = function(page) {
    return window.scrollTo(page.positionX, page.positionY);
  };

  resetScrollPosition = function() {
    if (document.location.hash) {
      return document.location.href = document.location.href;
    } else {
      return window.scrollTo(0, 0);
    }
  };

  clone = function(original) {
    var copy, key, value;
    if ((original == null) || typeof original !== 'object') {
      return original;
    }
    copy = new original.constructor();
    for (key in original) {
      value = original[key];
      copy[key] = clone(value);
    }
    return copy;
  };

  popCookie = function(name) {
    var ref, value;
    value = ((ref = document.cookie.match(new RegExp(name + "=(\\w+)"))) != null ? ref[1].toUpperCase() : void 0) || '';
    document.cookie = name + '=; expires=Thu, 01-Jan-70 00:00:01 GMT; path=/';
    return value;
  };

  triggerEvent = function(name, data) {
    var event;
    if (typeof Prototype !== 'undefined') {
      Event.fire(document, name, data, true);
    }
    event = document.createEvent('Events');
    if (data) {
      event.data = data;
    }
    event.initEvent(name, true, true);
    return document.dispatchEvent(event);
  };

  pageChangePrevented = function(url) {
    return !triggerEvent(EVENTS.BEFORE_CHANGE, {
      url: url
    });
  };

  processResponse = function() {
    var assetsChanged, clientOrServerError, doc, extractTrackAssets, intersection, validContent;
    clientOrServerError = function() {
      var ref;
      return (400 <= (ref = xhr.status) && ref < 600);
    };
    validContent = function() {
      var contentType;
      return ((contentType = xhr.getResponseHeader('Content-Type')) != null) && contentType.match(/^(?:text\/html|application\/xhtml\+xml|application\/xml)(?:;|$)/);
    };
    extractTrackAssets = function(doc) {
      var i, len, node, ref, results;
      ref = doc.querySelector('head').childNodes;
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        node = ref[i];
        if ((typeof node.getAttribute === "function" ? node.getAttribute('data-turbolinks-track') : void 0) != null) {
          results.push(node.getAttribute('src') || node.getAttribute('href'));
        }
      }
      return results;
    };
    assetsChanged = function(doc) {
      var fetchedAssets;
      loadedAssets || (loadedAssets = extractTrackAssets(document));
      fetchedAssets = extractTrackAssets(doc);
      return fetchedAssets.length !== loadedAssets.length || intersection(fetchedAssets, loadedAssets).length !== loadedAssets.length;
    };
    intersection = function(a, b) {
      var i, len, ref, results, value;
      if (a.length > b.length) {
        ref = [b, a], a = ref[0], b = ref[1];
      }
      results = [];
      for (i = 0, len = a.length; i < len; i++) {
        value = a[i];
        if (indexOf.call(b, value) >= 0) {
          results.push(value);
        }
      }
      return results;
    };
    if (!clientOrServerError() && validContent()) {
      doc = createDocument(xhr.responseText);
      if (doc && !assetsChanged(doc)) {
        return doc;
      }
    }
  };

  extractTitleAndBody = function(doc) {
    var title;
    title = doc.querySelector('title');
    return [title != null ? title.textContent : void 0, removeNoscriptTags(doc.querySelector('body')), CSRFToken.get(doc).token, 'runScripts'];
  };

  CSRFToken = {
    get: function(doc) {
      var tag;
      if (doc == null) {
        doc = document;
      }
      return {
        node: tag = doc.querySelector('meta[name="csrf-token"]'),
        token: tag != null ? typeof tag.getAttribute === "function" ? tag.getAttribute('content') : void 0 : void 0
      };
    },
    update: function(latest) {
      var current;
      current = this.get();
      if ((current.token != null) && (latest != null) && current.token !== latest) {
        return current.node.setAttribute('content', latest);
      }
    }
  };

  createDocument = function(html) {
    var doc;
    doc = document.documentElement.cloneNode();
    doc.innerHTML = html;
    doc.head = doc.querySelector('head');
    doc.body = doc.querySelector('body');
    return doc;
  };

  ComponentUrl = (function() {
    function ComponentUrl(original1) {
      this.original = original1 != null ? original1 : document.location.href;
      if (this.original.constructor === ComponentUrl) {
        return this.original;
      }
      this._parse();
    }

    ComponentUrl.prototype.withoutHash = function() {
      return this.href.replace(this.hash, '').replace('#', '');
    };

    ComponentUrl.prototype.withoutHashForIE10compatibility = function() {
      return this.withoutHash();
    };

    ComponentUrl.prototype.hasNoHash = function() {
      return this.hash.length === 0;
    };

    ComponentUrl.prototype.crossOrigin = function() {
      return this.origin !== (new ComponentUrl).origin;
    };

    ComponentUrl.prototype._parse = function() {
      var ref;
      (this.link != null ? this.link : this.link = document.createElement('a')).href = this.original;
      ref = this.link, this.href = ref.href, this.protocol = ref.protocol, this.host = ref.host, this.hostname = ref.hostname, this.port = ref.port, this.pathname = ref.pathname, this.search = ref.search, this.hash = ref.hash;
      this.origin = [this.protocol, '//', this.hostname].join('');
      if (this.port.length !== 0) {
        this.origin += ":" + this.port;
      }
      this.relative = [this.pathname, this.search, this.hash].join('');
      return this.absolute = this.href;
    };

    return ComponentUrl;

  })();

  Link = (function(superClass) {
    extend(Link, superClass);

    Link.HTML_EXTENSIONS = ['html'];

    Link.allowExtensions = function() {
      var extension, extensions, i, len;
      extensions = 1 <= arguments.length ? slice.call(arguments, 0) : [];
      for (i = 0, len = extensions.length; i < len; i++) {
        extension = extensions[i];
        Link.HTML_EXTENSIONS.push(extension);
      }
      return Link.HTML_EXTENSIONS;
    };

    function Link(link1) {
      this.link = link1;
      if (this.link.constructor === Link) {
        return this.link;
      }
      this.original = this.link.href;
      this.originalElement = this.link;
      this.link = this.link.cloneNode(false);
      Link.__super__.constructor.apply(this, arguments);
    }

    Link.prototype.shouldIgnore = function() {
      return this.crossOrigin() || this._anchored() || this._nonHtml() || this._optOut() || this._target();
    };

    Link.prototype._anchored = function() {
      return (this.hash.length > 0 || this.href.charAt(this.href.length - 1) === '#') && (this.withoutHash() === (new ComponentUrl).withoutHash());
    };

    Link.prototype._nonHtml = function() {
      return this.pathname.match(/\.[a-z]+$/g) && !this.pathname.match(new RegExp("\\.(?:" + (Link.HTML_EXTENSIONS.join('|')) + ")?$", 'g'));
    };

    Link.prototype._optOut = function() {
      var ignore, link;
      link = this.originalElement;
      while (!(ignore || link === document)) {
        ignore = link.getAttribute('data-no-turbolink') != null;
        link = link.parentNode;
      }
      return ignore;
    };

    Link.prototype._target = function() {
      return this.link.target.length !== 0;
    };

    return Link;

  })(ComponentUrl);

  Click = (function() {
    Click.installHandlerLast = function(event) {
      if (!event.defaultPrevented) {
        document.removeEventListener('click', Click.handle, false);
        return document.addEventListener('click', Click.handle, false);
      }
    };

    Click.handle = function(event) {
      return new Click(event);
    };

    function Click(event1) {
      this.event = event1;
      if (this.event.defaultPrevented) {
        return;
      }
      this._extractLink();
      if (this._validForTurbolinks()) {
        if (!pageChangePrevented(this.link.absolute)) {
          visit(this.link.href);
        }
        this.event.preventDefault();
      }
    }

    Click.prototype._extractLink = function() {
      var link;
      link = this.event.target;
      while (!(!link.parentNode || link.nodeName === 'A')) {
        link = link.parentNode;
      }
      if (link.nodeName === 'A' && link.href.length !== 0) {
        return this.link = new Link(link);
      }
    };

    Click.prototype._validForTurbolinks = function() {
      return (this.link != null) && !(this.link.shouldIgnore() || this._nonStandardClick());
    };

    Click.prototype._nonStandardClick = function() {
      return this.event.which > 1 || this.event.metaKey || this.event.ctrlKey || this.event.shiftKey || this.event.altKey;
    };

    return Click;

  })();

  ProgressBar = (function() {
    var className;

    className = 'turbolinks-progress-bar';

    function ProgressBar(elementSelector) {
      this.elementSelector = elementSelector;
      this._trickle = bind(this._trickle, this);
      this.value = 0;
      this.content = '';
      this.speed = 300;
      this.opacity = 0.99;
      this.install();
    }

    ProgressBar.prototype.install = function() {
      this.element = document.querySelector(this.elementSelector);
      this.element.classList.add(className);
      this.styleElement = document.createElement('style');
      document.head.appendChild(this.styleElement);
      return this._updateStyle();
    };

    ProgressBar.prototype.uninstall = function() {
      this.element.classList.remove(className);
      return document.head.removeChild(this.styleElement);
    };

    ProgressBar.prototype.start = function() {
      return this.advanceTo(5);
    };

    ProgressBar.prototype.advanceTo = function(value) {
      var ref;
      if ((value > (ref = this.value) && ref <= 100)) {
        this.value = value;
        this._updateStyle();
        if (this.value === 100) {
          return this._stopTrickle();
        } else if (this.value > 0) {
          return this._startTrickle();
        }
      }
    };

    ProgressBar.prototype.done = function() {
      if (this.value > 0) {
        this.advanceTo(100);
        return this._reset();
      }
    };

    ProgressBar.prototype._reset = function() {
      var originalOpacity;
      originalOpacity = this.opacity;
      setTimeout((function(_this) {
        return function() {
          _this.opacity = 0;
          return _this._updateStyle();
        };
      })(this), this.speed / 2);
      return setTimeout((function(_this) {
        return function() {
          _this.value = 0;
          _this.opacity = originalOpacity;
          return _this._withSpeed(0, function() {
            return _this._updateStyle(true);
          });
        };
      })(this), this.speed);
    };

    ProgressBar.prototype._startTrickle = function() {
      if (this.trickling) {
        return;
      }
      this.trickling = true;
      return setTimeout(this._trickle, this.speed);
    };

    ProgressBar.prototype._stopTrickle = function() {
      return delete this.trickling;
    };

    ProgressBar.prototype._trickle = function() {
      if (!this.trickling) {
        return;
      }
      this.advanceTo(this.value + Math.random() / 2);
      return setTimeout(this._trickle, this.speed);
    };

    ProgressBar.prototype._withSpeed = function(speed, fn) {
      var originalSpeed, result;
      originalSpeed = this.speed;
      this.speed = speed;
      result = fn();
      this.speed = originalSpeed;
      return result;
    };

    ProgressBar.prototype._updateStyle = function(forceRepaint) {
      if (forceRepaint == null) {
        forceRepaint = false;
      }
      if (forceRepaint) {
        this._changeContentToForceRepaint();
      }
      return this.styleElement.textContent = this._createCSSRule();
    };

    ProgressBar.prototype._changeContentToForceRepaint = function() {
      return this.content = this.content === '' ? ' ' : '';
    };

    ProgressBar.prototype._createCSSRule = function() {
      return this.elementSelector + "." + className + "::before {\n  content: '" + this.content + "';\n  position: fixed;\n  top: 0;\n  left: 0;\n  z-index: 2000;\n  background-color: #0076ff;\n  height: 3px;\n  opacity: " + this.opacity + ";\n  width: " + this.value + "%;\n  transition: width " + this.speed + "ms ease-out, opacity " + (this.speed / 2) + "ms ease-in;\n  transform: translate3d(0,0,0);\n}";
    };

    return ProgressBar;

  })();

  bypassOnLoadPopstate = function(fn) {
    return setTimeout(fn, 500);
  };

  installDocumentReadyPageEventTriggers = function() {
    return document.addEventListener('DOMContentLoaded', (function() {
      triggerEvent(EVENTS.CHANGE);
      return triggerEvent(EVENTS.UPDATE);
    }), true);
  };

  installJqueryAjaxSuccessPageUpdateTrigger = function() {
    if (typeof jQuery !== 'undefined') {
      return jQuery(document).on('ajaxSuccess', function(event, xhr, settings) {
        if (!jQuery.trim(xhr.responseText)) {
          return;
        }
        return triggerEvent(EVENTS.UPDATE);
      });
    }
  };

  installHistoryChangeHandler = function(event) {
    var cachedPage, ref;
    if ((ref = event.state) != null ? ref.turbolinks : void 0) {
      if (cachedPage = pageCache[(new ComponentUrl(event.state.url)).absolute]) {
        cacheCurrentPage();
        return fetchHistory(cachedPage);
      } else {
        return visit(event.target.location.href);
      }
    }
  };

  initializeTurbolinks = function() {
    rememberCurrentUrl();
    rememberCurrentState();
    document.addEventListener('click', Click.installHandlerLast, true);
    window.addEventListener('hashchange', function(event) {
      rememberCurrentUrl();
      return rememberCurrentState();
    }, false);
    return bypassOnLoadPopstate(function() {
      return window.addEventListener('popstate', installHistoryChangeHandler, false);
    });
  };

  historyStateIsDefined = window.history.state !== void 0 || navigator.userAgent.match(/Firefox\/2[6|7]/);

  browserSupportsPushState = window.history && window.history.pushState && window.history.replaceState && historyStateIsDefined;

  browserIsntBuggy = !navigator.userAgent.match(/CriOS\//);

  requestMethodIsSafe = (ref = popCookie('request_method')) === 'GET' || ref === '';

  browserSupportsTurbolinks = browserSupportsPushState && browserIsntBuggy && requestMethodIsSafe;

  browserSupportsCustomEvents = document.addEventListener && document.createEvent;

  if (browserSupportsCustomEvents) {
    installDocumentReadyPageEventTriggers();
    installJqueryAjaxSuccessPageUpdateTrigger();
  }

  if (browserSupportsTurbolinks) {
    visit = fetch;
    initializeTurbolinks();
  } else {
    visit = function(url) {
      return document.location.href = url;
    };
  }

  this.Turbolinks = {
    visit: visit,
    pagesCached: pagesCached,
    enableTransitionCache: enableTransitionCache,
    enableProgressBar: enableProgressBar,
    allowLinkExtensions: Link.allowExtensions,
    supported: browserSupportsTurbolinks,
    EVENTS: clone(EVENTS)
  };

}).call(this);





