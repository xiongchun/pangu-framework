"use strict";(self.webpackChunkpangu_website=self.webpackChunkpangu_website||[]).push([[6088],{3905:(e,t,r)=>{r.d(t,{Zo:()=>s,kt:()=>m});var n=r(7294);function a(e,t,r){return t in e?Object.defineProperty(e,t,{value:r,enumerable:!0,configurable:!0,writable:!0}):e[t]=r,e}function o(e,t){var r=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),r.push.apply(r,n)}return r}function i(e){for(var t=1;t<arguments.length;t++){var r=null!=arguments[t]?arguments[t]:{};t%2?o(Object(r),!0).forEach((function(t){a(e,t,r[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(r)):o(Object(r)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(r,t))}))}return e}function l(e,t){if(null==e)return{};var r,n,a=function(e,t){if(null==e)return{};var r,n,a={},o=Object.keys(e);for(n=0;n<o.length;n++)r=o[n],t.indexOf(r)>=0||(a[r]=e[r]);return a}(e,t);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);for(n=0;n<o.length;n++)r=o[n],t.indexOf(r)>=0||Object.prototype.propertyIsEnumerable.call(e,r)&&(a[r]=e[r])}return a}var c=n.createContext({}),u=function(e){var t=n.useContext(c),r=t;return e&&(r="function"==typeof e?e(t):i(i({},t),e)),r},s=function(e){var t=u(e.components);return n.createElement(c.Provider,{value:t},e.children)},d="mdxType",p={inlineCode:"code",wrapper:function(e){var t=e.children;return n.createElement(n.Fragment,{},t)}},g=n.forwardRef((function(e,t){var r=e.components,a=e.mdxType,o=e.originalType,c=e.parentName,s=l(e,["components","mdxType","originalType","parentName"]),d=u(r),g=a,m=d["".concat(c,".").concat(g)]||d[g]||p[g]||o;return r?n.createElement(m,i(i({ref:t},s),{},{components:r})):n.createElement(m,i({ref:t},s))}));function m(e,t){var r=arguments,a=t&&t.mdxType;if("string"==typeof e||a){var o=r.length,i=new Array(o);i[0]=g;var l={};for(var c in t)hasOwnProperty.call(t,c)&&(l[c]=t[c]);l.originalType=e,l[d]="string"==typeof e?e:a,i[1]=l;for(var u=2;u<o;u++)i[u]=r[u];return n.createElement.apply(null,i)}return n.createElement.apply(null,r)}g.displayName="MDXCreateElement"},3040:(e,t,r)=>{r.r(t),r.d(t,{assets:()=>c,contentTitle:()=>i,default:()=>d,frontMatter:()=>o,metadata:()=>l,toc:()=>u});var n=r(7462),a=(r(7294),r(3905));const o={title:"\u6ce8\u518c\u4e2d\u5fc3",tags:["nacos","\u6ce8\u518c\u4e2d\u5fc3","Dubbo","\u670d\u52a1\u6ce8\u518c","\u670d\u52a1\u53d1\u73b0","\u76d8\u53e4\u7b80\u4ecb","\u76d8\u53e4\u67b6\u6784"],sidebar_position:2,slug:"/advanced-guide/nacos-regist-center"},i=void 0,l={unversionedId:"advanced-guide/\u6ce8\u518c\u4e2d\u5fc3",id:"advanced-guide/\u6ce8\u518c\u4e2d\u5fc3",title:"\u6ce8\u518c\u4e2d\u5fc3",description:"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6 | \u670d\u52a1\u53d1\u73b0\u548c\u670d\u52a1\u5065\u5eb7\u76d1\u6d4b | \u52a8\u6001\u914d\u7f6e\u670d\u52a1 | \u52a8\u6001 DNS \u670d\u52a1 | \u670d\u52a1\u53ca\u5176\u5143\u6570\u636e\u7ba1\u7406 | Nacos",source:"@site/docs/advanced-guide/\u6ce8\u518c\u4e2d\u5fc3.md",sourceDirName:"advanced-guide",slug:"/advanced-guide/nacos-regist-center",permalink:"/pangu-framework/docs/advanced-guide/nacos-regist-center",draft:!1,editUrl:"https://gitee.com/xiong-chun/pangu-framework/tree/master/pangu-website/docs/advanced-guide/\u6ce8\u518c\u4e2d\u5fc3.md",tags:[{label:"nacos",permalink:"/pangu-framework/docs/tags/nacos"},{label:"\u6ce8\u518c\u4e2d\u5fc3",permalink:"/pangu-framework/docs/tags/\u6ce8\u518c\u4e2d\u5fc3"},{label:"Dubbo",permalink:"/pangu-framework/docs/tags/dubbo"},{label:"\u670d\u52a1\u6ce8\u518c",permalink:"/pangu-framework/docs/tags/\u670d\u52a1\u6ce8\u518c"},{label:"\u670d\u52a1\u53d1\u73b0",permalink:"/pangu-framework/docs/tags/\u670d\u52a1\u53d1\u73b0"},{label:"\u76d8\u53e4\u7b80\u4ecb",permalink:"/pangu-framework/docs/tags/\u76d8\u53e4\u7b80\u4ecb"},{label:"\u76d8\u53e4\u67b6\u6784",permalink:"/pangu-framework/docs/tags/\u76d8\u53e4\u67b6\u6784"}],version:"current",lastUpdatedBy:"xiongchun",sidebarPosition:2,frontMatter:{title:"\u6ce8\u518c\u4e2d\u5fc3",tags:["nacos","\u6ce8\u518c\u4e2d\u5fc3","Dubbo","\u670d\u52a1\u6ce8\u518c","\u670d\u52a1\u53d1\u73b0","\u76d8\u53e4\u7b80\u4ecb","\u76d8\u53e4\u67b6\u6784"],sidebar_position:2,slug:"/advanced-guide/nacos-regist-center"},sidebar:"tutorialSidebar",previous:{title:"\u914d\u7f6e\u4e2d\u5fc3",permalink:"/pangu-framework/docs/advanced-guide/nacos-config-center"},next:{title:"\u6570\u636e\u6301\u4e45\u5316",permalink:"/pangu-framework/docs/advanced-guide/data-persistance"}},c={},u=[{value:"\u6ce8\u518c\u4e2d\u5fc3\u4ecb\u7ecd",id:"\u6ce8\u518c\u4e2d\u5fc3\u4ecb\u7ecd",level:2},{value:"\u76f8\u5173\u540d\u8bcd\u89e3\u91ca",id:"\u76f8\u5173\u540d\u8bcd\u89e3\u91ca",level:3},{value:"\u6ce8\u518c\u4e2d\u5fc3",id:"\u6ce8\u518c\u4e2d\u5fc3",level:4},{value:"\u670d\u52a1\u6ce8\u518c",id:"\u670d\u52a1\u6ce8\u518c",level:4},{value:"\u670d\u52a1\u53d1\u73b0",id:"\u670d\u52a1\u53d1\u73b0",level:4},{value:"\u5065\u5eb7\u68c0\u67e5",id:"\u5065\u5eb7\u68c0\u67e5",level:4},{value:"\u6ce8\u518c\u4e2d\u5fc3\u56fe\u793a",id:"\u6ce8\u518c\u4e2d\u5fc3\u56fe\u793a",level:3},{value:"\u6ce8\u518c\u4e2d\u5fc3\u5b9e\u6218",id:"\u6ce8\u518c\u4e2d\u5fc3\u5b9e\u6218",level:2},{value:"\u4e0b\u4e00\u6b65",id:"\u4e0b\u4e00\u6b65",level:2}],s={toc:u};function d(e){let{components:t,...o}=e;return(0,a.kt)("wrapper",(0,n.Z)({},s,o,{components:t,mdxType:"MDXLayout"}),(0,a.kt)("head",null,(0,a.kt)("title",null,"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6 | \u670d\u52a1\u53d1\u73b0\u548c\u670d\u52a1\u5065\u5eb7\u76d1\u6d4b | \u52a8\u6001\u914d\u7f6e\u670d\u52a1 | \u52a8\u6001 DNS \u670d\u52a1 | \u670d\u52a1\u53ca\u5176\u5143\u6570\u636e\u7ba1\u7406 | Nacos"),(0,a.kt)("meta",{name:"keywords",content:"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6 | \u670d\u52a1\u53d1\u73b0\u548c\u670d\u52a1\u5065\u5eb7\u76d1\u6d4b | \u52a8\u6001\u914d\u7f6e\u670d\u52a1 | \u52a8\u6001 DNS \u670d\u52a1 | \u670d\u52a1\u53ca\u5176\u5143\u6570\u636e\u7ba1\u7406 | Nacos"})),(0,a.kt)("p",null,"\u6ce8\u518c\u4e2d\u5fc3\u662f\u5206\u5e03\u5f0f\u5fae\u670d\u52a1\u5f00\u53d1\u7684\u6807\u914d\u7ec4\u4ef6\uff0c\u76d8\u53e4\u670d\u52a1\u6ce8\u518c\u4e2d\u5fc3\u501f\u52a9 ",(0,a.kt)("a",{parentName:"p",href:"/thanks"},"Nacos")," \u63d0\u4f9b\u52a8\u6001\u670d\u52a1\u6ce8\u518c\u548c\u670d\u52a1\u53d1\u73b0\u80fd\u529b\u3002"),(0,a.kt)("h2",{id:"\u6ce8\u518c\u4e2d\u5fc3\u4ecb\u7ecd"},"\u6ce8\u518c\u4e2d\u5fc3\u4ecb\u7ecd"),(0,a.kt)("p",null,"\u670d\u52a1\u6ce8\u518c\u4e2d\u5fc3\u662f\u4ee5\u670d\u52a1\u4e3a\u4e2d\u5fc3\u67b6\u6784\uff0c\u5b9e\u73b0\u670d\u52a1\u5316\u7ba1\u7406\u7684\u6838\u5fc3\u7ec4\u4ef6\u3002\u7c7b\u4f3c\u4e8e\u76ee\u5f55\u670d\u52a1\u7684\u4f5c\u7528\uff0c\u4e3b\u8981\u7528\u6765\u5b58\u50a8\u670d\u52a1\u5b9e\u4f8b\u4fe1\u606f\uff0c\u8b6c\u5982\u63d0\u4f9b\u8005\u5730\u5740\u3001\u8def\u7531\u4fe1\u606f\u7b49\u3002\u670d\u52a1\u6ce8\u518c\u4e2d\u5fc3\u662f\u5fae\u670d\u52a1\u67b6\u6784\u4e2d\u5fc5\u9009\u7684\u6807\u914d\u57fa\u7840\u8bbe\u65bd\u4e4b\u4e00\u3002"),(0,a.kt)("h3",{id:"\u76f8\u5173\u540d\u8bcd\u89e3\u91ca"},"\u76f8\u5173\u540d\u8bcd\u89e3\u91ca"),(0,a.kt)("h4",{id:"\u6ce8\u518c\u4e2d\u5fc3"},"\u6ce8\u518c\u4e2d\u5fc3"),(0,a.kt)("p",null,"\u5b58\u50a8\u670d\u52a1\u5b9e\u4f8b\u548c\u670d\u52a1\u8d1f\u8f7d\u5747\u8861\u7b56\u7565\u7684\u7cfb\u7edf\u3002"),(0,a.kt)("h4",{id:"\u670d\u52a1\u6ce8\u518c"},"\u670d\u52a1\u6ce8\u518c"),(0,a.kt)("p",null,"\u5c06\u670d\u52a1\u5b9e\u4f8b\u5730\u5740\u548c\u5143\u6570\u636e\u4fe1\u606f\u5199\u5165\u670d\u52a1\u6ce8\u518c\u4e2d\u5fc3\u7684\u8fc7\u7a0b\u3002"),(0,a.kt)("h4",{id:"\u670d\u52a1\u53d1\u73b0"},"\u670d\u52a1\u53d1\u73b0"),(0,a.kt)("p",null,"\u5728\u8ba1\u7b97\u673a\u7f51\u7edc\u4e0a\uff0c\u4f7f\u7528\u670d\u52a1\u540d\u5bf9\u670d\u52a1\u7684\u5b9e\u4f8b\u5730\u5740\u548c\u5143\u6570\u636e\u8fdb\u884c\u63a2\u6d4b\uff0c\u5e76\u4ee5\u9884\u5148\u5b9a\u4e49\u7684\u63a5\u53e3\u63d0\u4f9b\u7ed9\u5ba2\u6237\u7aef\u8fdb\u884c\u67e5\u8be2\u3002"),(0,a.kt)("h4",{id:"\u5065\u5eb7\u68c0\u67e5"},"\u5065\u5eb7\u68c0\u67e5"),(0,a.kt)("p",null,"\u4ee5\u6307\u5b9a\u65b9\u5f0f\u68c0\u67e5\u670d\u52a1\u4e0b\u6302\u8f7d\u5b9e\u4f8b\u7684\u5065\u5eb7\u5ea6\uff0c\u4ece\u800c\u786e\u8ba4\u8be5\u5b9e\u4f8b\u662f\u5426\u80fd\u63d0\u4f9b\u670d\u52a1\u3002\u6839\u636e\u68c0\u67e5\u7ed3\u679c\uff0c\u5b9e\u4f8b\u4f1a\u88ab\u5224\u65ad\u4e3a\u5065\u5eb7\u6216\u4e0d\u5065\u5eb7\u3002\u5bf9\u670d\u52a1\u53d1\u8d77\u89e3\u6790\u8bf7\u6c42\u65f6\uff0c\u4e0d\u5065\u5eb7\u7684\u5b9e\u4f8b\u4e0d\u4f1a\u8fd4\u56de\u7ed9\u5ba2\u6237\u7aef\u3002"),(0,a.kt)("h3",{id:"\u6ce8\u518c\u4e2d\u5fc3\u56fe\u793a"},"\u6ce8\u518c\u4e2d\u5fc3\u56fe\u793a"),(0,a.kt)("p",null,(0,a.kt)("img",{alt:"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6\u6ce8\u518c\u4e2d\u5fc3\u56fe\u793a",src:r(3980).Z,width:"2872",height:"1358"})),(0,a.kt)("h2",{id:"\u6ce8\u518c\u4e2d\u5fc3\u5b9e\u6218"},"\u6ce8\u518c\u4e2d\u5fc3\u5b9e\u6218"),(0,a.kt)("p",null,"\u8bf7\u53c2\u8003\u672c\u6307\u5357\u7684 ",(0,a.kt)("a",{parentName:"p",href:"/docs/quick-start/how-to-make-microservice-architecture-app"},"\u5feb\u901f\u5f00\u59cb->\u5982\u4f55\u5f00\u53d1\u5fae\u670d\u52a1")," \u7ae0\u8282\uff0c\u90a3\u91cc\u5df2\u7ecf\u8be6\u7ec6\u5b8c\u6574\u7684\u8bb2\u89e3\u4e86\u670d\u52a1\u6ce8\u518c&\u670d\u52a1\u53d1\u73b0\u7684\u76f8\u5173\u5185\u5bb9\u3002"),(0,a.kt)("h2",{id:"\u4e0b\u4e00\u6b65"},"\u4e0b\u4e00\u6b65"),(0,a.kt)("p",null,"\u7ee7\u7eed\u9605\u8bfb\u5176\u5b83\u7ae0\u8282\u83b7\u53d6\u4f60\u60f3\u8981\u7684\u7b54\u6848\u6216\u901a\u8fc7\u6211\u4eec\u7684 ",(0,a.kt)("a",{parentName:"p",href:"/community"},"\u5f00\u53d1\u8005\u793e\u533a")," \u5bfb\u6c42\u66f4\u591a\u5e2e\u52a9\u3002"))}d.isMDXComponent=!0},3980:(e,t,r)=>{r.d(t,{Z:()=>n});const n=r.p+"assets/images/8-pangu-framework-nacos-7fa670ee776977bdde35ba85cffeb379.png"}}]);