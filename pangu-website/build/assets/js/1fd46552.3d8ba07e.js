"use strict";(self.webpackChunkpangu_website=self.webpackChunkpangu_website||[]).push([[5092],{3905:function(e,n,t){t.d(n,{Zo:function(){return p},kt:function(){return m}});var a=t(7294);function r(e,n,t){return n in e?Object.defineProperty(e,n,{value:t,enumerable:!0,configurable:!0,writable:!0}):e[n]=t,e}function l(e,n){var t=Object.keys(e);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);n&&(a=a.filter((function(n){return Object.getOwnPropertyDescriptor(e,n).enumerable}))),t.push.apply(t,a)}return t}function i(e){for(var n=1;n<arguments.length;n++){var t=null!=arguments[n]?arguments[n]:{};n%2?l(Object(t),!0).forEach((function(n){r(e,n,t[n])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(t)):l(Object(t)).forEach((function(n){Object.defineProperty(e,n,Object.getOwnPropertyDescriptor(t,n))}))}return e}function o(e,n){if(null==e)return{};var t,a,r=function(e,n){if(null==e)return{};var t,a,r={},l=Object.keys(e);for(a=0;a<l.length;a++)t=l[a],n.indexOf(t)>=0||(r[t]=e[t]);return r}(e,n);if(Object.getOwnPropertySymbols){var l=Object.getOwnPropertySymbols(e);for(a=0;a<l.length;a++)t=l[a],n.indexOf(t)>=0||Object.prototype.propertyIsEnumerable.call(e,t)&&(r[t]=e[t])}return r}var u=a.createContext({}),s=function(e){var n=a.useContext(u),t=n;return e&&(t="function"==typeof e?e(n):i(i({},n),e)),t},p=function(e){var n=s(e.components);return a.createElement(u.Provider,{value:n},e.children)},d={inlineCode:"code",wrapper:function(e){var n=e.children;return a.createElement(a.Fragment,{},n)}},c=a.forwardRef((function(e,n){var t=e.components,r=e.mdxType,l=e.originalType,u=e.parentName,p=o(e,["components","mdxType","originalType","parentName"]),c=s(t),m=r,h=c["".concat(u,".").concat(m)]||c[m]||d[m]||l;return t?a.createElement(h,i(i({ref:n},p),{},{components:t})):a.createElement(h,i({ref:n},p))}));function m(e,n){var t=arguments,r=n&&n.mdxType;if("string"==typeof e||r){var l=t.length,i=new Array(l);i[0]=c;var o={};for(var u in n)hasOwnProperty.call(n,u)&&(o[u]=n[u]);o.originalType=e,o.mdxType="string"==typeof e?e:r,i[1]=o;for(var s=2;s<l;s++)i[s]=t[s];return a.createElement.apply(null,i)}return a.createElement.apply(null,t)}c.displayName="MDXCreateElement"},8215:function(e,n,t){var a=t(7294);n.Z=function(e){var n=e.children,t=e.hidden,r=e.className;return a.createElement("div",{role:"tabpanel",hidden:t,className:r},n)}},6396:function(e,n,t){t.d(n,{Z:function(){return c}});var a=t(7462),r=t(7294),l=t(2389),i=t(9443);var o=function(){var e=(0,r.useContext)(i.Z);if(null==e)throw new Error('"useUserPreferencesContext" is used outside of "Layout" component.');return e},u=t(3616),s=t(6010),p="tabItem_vU9c";function d(e){var n,t,a,l=e.lazy,i=e.block,d=e.defaultValue,c=e.values,m=e.groupId,h=e.className,b=r.Children.map(e.children,(function(e){if((0,r.isValidElement)(e)&&void 0!==e.props.value)return e;throw new Error("Docusaurus error: Bad <Tabs> child <"+("string"==typeof e.type?e.type:e.type.name)+'>: all children of the <Tabs> component should be <TabItem>, and every <TabItem> should have a unique "value" prop.')})),g=null!=c?c:b.map((function(e){var n=e.props;return{value:n.value,label:n.label}})),v=(0,u.lx)(g,(function(e,n){return e.value===n.value}));if(v.length>0)throw new Error('Docusaurus error: Duplicate values "'+v.map((function(e){return e.value})).join(", ")+'" found in <Tabs>. Every value needs to be unique.');var k=null===d?d:null!=(n=null!=d?d:null==(t=b.find((function(e){return e.props.default})))?void 0:t.props.value)?n:null==(a=b[0])?void 0:a.props.value;if(null!==k&&!g.some((function(e){return e.value===k})))throw new Error('Docusaurus error: The <Tabs> has a defaultValue "'+k+'" but none of its children has the corresponding value. Available values are: '+g.map((function(e){return e.value})).join(", ")+". If you intend to show no default tab, use defaultValue={null} instead.");var f=o(),y=f.tabGroupChoices,N=f.setTabGroupChoices,w=(0,r.useState)(k),x=w[0],E=w[1],S=[],C=(0,u.o5)().blockElementScrollPositionUntilNextRender;if(null!=m){var T=y[m];null!=T&&T!==x&&g.some((function(e){return e.value===T}))&&E(T)}var I=function(e){var n=e.currentTarget,t=S.indexOf(n),a=g[t].value;a!==x&&(C(n),E(a),null!=m&&N(m,a))},O=function(e){var n,t=null;switch(e.key){case"ArrowRight":var a=S.indexOf(e.currentTarget)+1;t=S[a]||S[0];break;case"ArrowLeft":var r=S.indexOf(e.currentTarget)-1;t=S[r]||S[S.length-1]}null==(n=t)||n.focus()};return r.createElement("div",{className:"tabs-container"},r.createElement("ul",{role:"tablist","aria-orientation":"horizontal",className:(0,s.Z)("tabs",{"tabs--block":i},h)},g.map((function(e){var n=e.value,t=e.label;return r.createElement("li",{role:"tab",tabIndex:x===n?0:-1,"aria-selected":x===n,className:(0,s.Z)("tabs__item",p,{"tabs__item--active":x===n}),key:n,ref:function(e){return S.push(e)},onKeyDown:O,onFocus:I,onClick:I},null!=t?t:n)}))),l?(0,r.cloneElement)(b.filter((function(e){return e.props.value===x}))[0],{className:"margin-vert--md"}):r.createElement("div",{className:"margin-vert--md"},b.map((function(e,n){return(0,r.cloneElement)(e,{key:n,hidden:e.props.value!==x})}))))}function c(e){var n=(0,l.Z)();return r.createElement(d,(0,a.Z)({key:String(n)},e))}},8255:function(e,n,t){t.r(n),t.d(n,{frontMatter:function(){return s},contentTitle:function(){return p},metadata:function(){return d},toc:function(){return c},default:function(){return h}});var a=t(7462),r=t(3366),l=(t(7294),t(3905)),i=t(6396),o=t(8215),u=["components"],s={title:"\u5982\u4f55\u5f00\u53d1\u7f51\u5173\uff08ShenYu\uff09",tags:["\u5feb\u901f\u5f00\u59cb","\u7f51\u5173"],sidebar_position:50,slug:"/quick-start/how-to-make-gateway-app/shenyu-based"},p="\u57fa\u4e8eShenYu\u7684\u4e13\u4e1a\u7f51\u5173\u5f00\u53d1",d={unversionedId:"quick-start/\u7f51\u5173\u9ad8\u7ea7\u6a21\u5f0f",id:"quick-start/\u7f51\u5173\u9ad8\u7ea7\u6a21\u5f0f",title:"\u5982\u4f55\u5f00\u53d1\u7f51\u5173\uff08ShenYu\uff09",description:"\u7f51\u5173\u5f00\u53d1\u6a21\u5f0f\u9009\u578b\u53c2\u8003\u5efa\u8bae\u8bf7\u770b\u4e0a\u6587\u300a\u7f51\u5173\u5f00\u53d1\u6a21\u5f0f\u7b80\u4ecb\u300b\u3002",source:"@site/docs/quick-start/\u7f51\u5173\u9ad8\u7ea7\u6a21\u5f0f.md",sourceDirName:"quick-start",slug:"/quick-start/how-to-make-gateway-app/shenyu-based",permalink:"/pangu-framework/docs/quick-start/how-to-make-gateway-app/shenyu-based",editUrl:"https://gitee.com/pulanos/pangu-framework/tree/master/pangu-website/docs/quick-start/\u7f51\u5173\u9ad8\u7ea7\u6a21\u5f0f.md",tags:[{label:"\u5feb\u901f\u5f00\u59cb",permalink:"/pangu-framework/docs/tags/\u5feb\u901f\u5f00\u59cb"},{label:"\u7f51\u5173",permalink:"/pangu-framework/docs/tags/\u7f51\u5173"}],version:"current",sidebarPosition:50,frontMatter:{title:"\u5982\u4f55\u5f00\u53d1\u7f51\u5173\uff08ShenYu\uff09",tags:["\u5feb\u901f\u5f00\u59cb","\u7f51\u5173"],sidebar_position:50,slug:"/quick-start/how-to-make-gateway-app/shenyu-based"},sidebar:"tutorialSidebar",previous:{title:"\u5982\u4f55\u5f00\u53d1\u7f51\u5173\uff08SpringMVC\uff09",permalink:"/pangu-framework/docs/quick-start/how-to-make-gateway-app/springmvc-based"},next:{title:"\u914d\u7f6e\u4e2d\u5fc3",permalink:"/pangu-framework/docs/advanced-guide/nacos-config-center"}},c=[{value:"\u7f51\u5173\u6a21\u5757\u5f00\u53d1",id:"\u7f51\u5173\u6a21\u5757\u5f00\u53d1",children:[{value:"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6a21\u5757",id:"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6a21\u5757",children:[],level:3},{value:"\u672c\u5730\u914d\u7f6e",id:"\u672c\u5730\u914d\u7f6e",children:[{value:"\u5173\u952e\u914d\u7f6e\u9879\u8bf4\u660e",id:"\u5173\u952e\u914d\u7f6e\u9879\u8bf4\u660e",children:[],level:5}],level:3},{value:"\u8c03\u7528\u5fae\u670d\u52a1\u63a5\u53e3",id:"\u8c03\u7528\u5fae\u670d\u52a1\u63a5\u53e3",children:[],level:3},{value:"\u542f\u52a8\u5165\u53e3",id:"\u542f\u52a8\u5165\u53e3",children:[],level:3}],level:2},{value:"Dubbo\u670d\u52a1\u7aef\uff08\u7f51\u5173\u91c7\u96c6\u63a5\u53e3\u5143\u6570\u636e\uff09",id:"dubbo\u670d\u52a1\u7aef\u7f51\u5173\u91c7\u96c6\u63a5\u53e3\u5143\u6570\u636e",children:[{value:"\u5b89\u88c5ShenYu Client\u4f9d\u8d56\u5305",id:"\u5b89\u88c5shenyu-client\u4f9d\u8d56\u5305",children:[],level:3},{value:"\u589e\u52a0\u914d\u7f6e\u9879",id:"\u589e\u52a0\u914d\u7f6e\u9879",children:[],level:3},{value:"\u81ea\u52a8\u4e0a\u62a5\u670d\u52a1\u63a5\u53e3\u5143\u6570\u636e",id:"\u81ea\u52a8\u4e0a\u62a5\u670d\u52a1\u63a5\u53e3\u5143\u6570\u636e",children:[],level:3}],level:2},{value:"\u5b8c\u6574\u8bf7\u6c42URL\u53ca\u53c2\u6570\u8bf4\u660e",id:"\u5b8c\u6574\u8bf7\u6c42url\u53ca\u53c2\u6570\u8bf4\u660e",children:[{value:"\u8bf7\u6c42URL",id:"\u8bf7\u6c42url",children:[],level:3},{value:"\u53c2\u6570\u8bf4\u660e",id:"\u53c2\u6570\u8bf4\u660e",children:[],level:3},{value:"\u8bf7\u6c42\u793a\u4f8b",id:"\u8bf7\u6c42\u793a\u4f8b",children:[],level:3}],level:2},{value:"\u76f8\u5173\u53c2\u8003\u8303\u4f8b",id:"\u76f8\u5173\u53c2\u8003\u8303\u4f8b",children:[],level:2},{value:"\u4e0b\u4e00\u6b65",id:"\u4e0b\u4e00\u6b65",children:[],level:2}],m={toc:c};function h(e){var n=e.components,s=(0,r.Z)(e,u);return(0,l.kt)("wrapper",(0,a.Z)({},m,s,{components:n,mdxType:"MDXLayout"}),(0,l.kt)("h1",{id:"\u57fa\u4e8eshenyu\u7684\u4e13\u4e1a\u7f51\u5173\u5f00\u53d1"},"\u57fa\u4e8eShenYu\u7684\u4e13\u4e1a\u7f51\u5173\u5f00\u53d1"),(0,l.kt)("p",null,"\u7f51\u5173\u5f00\u53d1\u6a21\u5f0f\u9009\u578b\u53c2\u8003\u5efa\u8bae\u8bf7\u770b\u4e0a\u6587",(0,l.kt)("a",{parentName:"p",href:"/docs/quick-start/how-to-make-gateway-app"},"\u300a\u7f51\u5173\u5f00\u53d1\u6a21\u5f0f\u7b80\u4ecb\u300b"),"\u3002"),(0,l.kt)("h2",{id:"\u7f51\u5173\u6a21\u5757\u5f00\u53d1"},"\u7f51\u5173\u6a21\u5757\u5f00\u53d1"),(0,l.kt)("h3",{id:"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6a21\u5757"},"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6a21\u5757"),(0,l.kt)(i.Z,{mdxType:"Tabs"},(0,l.kt)(o.Z,{value:"parent",label:"\u76d8\u53e4Parent",mdxType:"TabItem"},(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"<parent>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-parent</artifactId>\n    <version>latest.version.xxx</version>\n    <relativePath/>\n</parent>\n"))),(0,l.kt)(o.Z,{value:"dependency1",label:"\u57fa\u7840\u6a21\u5757",mdxType:"TabItem"},(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-spring-boot-starter</artifactId>\n</dependency>\n"))),(0,l.kt)(o.Z,{value:"dependency2",label:"Dubbo\u6a21\u5757",mdxType:"TabItem"},(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-dubbo-spring-boot-starter</artifactId>\n</dependency>\n"))),(0,l.kt)(o.Z,{value:"dependency3",label:"\u7f51\u5173\u6a21\u5757",mdxType:"TabItem"},(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-gateway-spring-boot-starter</artifactId>\n</dependency>\n")))),(0,l.kt)("div",{className:"admonition admonition-tip alert alert--success"},(0,l.kt)("div",{parentName:"div",className:"admonition-heading"},(0,l.kt)("h5",{parentName:"div"},(0,l.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,l.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"12",height:"16",viewBox:"0 0 12 16"},(0,l.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M6.5 0C3.48 0 1 2.19 1 5c0 .92.55 2.25 1 3 1.34 2.25 1.78 2.78 2 4v1h5v-1c.22-1.22.66-1.75 2-4 .45-.75 1-2.08 1-3 0-2.81-2.48-5-5.5-5zm3.64 7.48c-.25.44-.47.8-.67 1.11-.86 1.41-1.25 2.06-1.45 3.23-.02.05-.02.11-.02.17H5c0-.06 0-.13-.02-.17-.2-1.17-.59-1.83-1.45-3.23-.2-.31-.42-.67-.67-1.11C2.44 6.78 2 5.65 2 5c0-2.2 2.02-4 4.5-4 1.22 0 2.36.42 3.22 1.19C10.55 2.94 11 3.94 11 5c0 .66-.44 1.78-.86 2.48zM4 14h5c-.23 1.14-1.3 2-2.5 2s-2.27-.86-2.5-2z"}))),"tip")),(0,l.kt)("div",{parentName:"div",className:"admonition-content"},(0,l.kt)("p",{parentName:"div"},"\u57fa\u4e8eShenYu\u7684\u7f51\u5173\u5f00\u53d1\u6a21\u5f0f\u4e0d\u9700\u8981\u5f15\u5165\u670d\u52a1\u63a5\u53e3\u4f9d\u8d56\u5305\uff0c\u7f51\u5173\u4f1a\u6839\u636e\u670d\u52a1\u63a5\u53e3\u7684\u5143\u6570\u636e\u4fe1\u606f\uff0c\u6cdb\u5316\u8c03\u7528Dubbo\u670d\u52a1\u63a5\u53e3\u3002\u670d\u52a1\u63a5\u53e3\u7684\u5143\u6570\u636e\u4fe1\u606f\u5219\u6839\u636eDubbo\u670d\u52a1\u5e94\u7528\u4e2d\u7684\u914d\u7f6e\u81ea\u52a8\u4e0a\u4f20\u5230ShenYu\u7f51\u5173\u7ba1\u7406\u7cfb\u7edf\u3002\u6b64\u5185\u5bb9\u5728\u4e0b\u6587\u4f1a\u7ee7\u7eed\u8bb2\u89e3\u3002"))),(0,l.kt)("h3",{id:"\u672c\u5730\u914d\u7f6e"},"\u672c\u5730\u914d\u7f6e"),(0,l.kt)("blockquote",null,(0,l.kt)("p",{parentName:"blockquote"},"\u4e3a\u4fbf\u4e8e\u7406\u89e3\uff0c\u672c\u6587\u57fa\u4e8e\u672c\u5730\u914d\u7f6e\u7684\u65b9\u5f0f\u7f16\u5199\u3002\u82e5\u6539\u4e3a\u6807\u51c6\u7684Nacos\u914d\u7f6e\u4e2d\u5fc3\u6a21\u5f0f\uff0c\u8bf7\u53c2\u9605:",(0,l.kt)("a",{parentName:"p",href:"/docs/advanced-guide/nacos-config-center"},"\u914d\u7f6e\u4e2d\u5fc3"),"\u7ae0\u8282\u3002")),(0,l.kt)(i.Z,{mdxType:"Tabs"},(0,l.kt)(o.Z,{value:"application",label:"application.yaml",mdxType:"TabItem"},(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"spring:\n  profiles:\n    active: ${spring.profiles.active:dev}\n"))),(0,l.kt)(o.Z,{value:"application-dev",label:"application-dev.yaml",mdxType:"TabItem"},(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx",metastring:"{24}","{24}":!0},'server:\n  port: 9090\n\nspring:\n  main:\n    allow-bean-definition-overriding: true\n\nshenyu:\n  cross:\n    enabled: true\n    allowedHeaders:\n    allowedMethods: "*"\n    allowedOrigin: "*"\n    allowedExpose: "*"\n    maxAge: "18000"\n    allowCredentials: true\n  switchConfig:\n    local: true\n  file:\n    enabled: true\n    maxSize : 10\n  sync:\n    websocket:\n      urls: ${shenyu.websocket.urls:ws://localhost:9095/websocket}\n  dubbo:\n    parameter: multi\n  exclude:\n    enabled: false\n    paths:\n      - /favicon.ico\n  extPlugin:\n    path:\n    enabled: true\n    threads: 1\n    scheduleTime: 300\n    scheduleDelay: 30\n  scheduler:\n    enabled: false\n    type: fixed\n    threads: 16\n  upstreamCheck:\n    enabled: false\n    timeout: 3000\n    healthyThreshold: 1\n    unhealthyThreshold: 1\n    interval: 5000\n    printEnabled: true\n    printInterval: 60000\n\nlogging:\n  level:\n    root: info\n    org.springframework.boot: info\n    org.apache.ibatis: info\n    org.apache.shenyu: info\n')))),(0,l.kt)("h5",{id:"\u5173\u952e\u914d\u7f6e\u9879\u8bf4\u660e"},"\u5173\u952e\u914d\u7f6e\u9879\u8bf4\u660e"),(0,l.kt)("table",null,(0,l.kt)("thead",{parentName:"table"},(0,l.kt)("tr",{parentName:"thead"},(0,l.kt)("th",{parentName:"tr",align:null},"\u914d\u7f6e\u9879"),(0,l.kt)("th",{parentName:"tr",align:null},"\u914d\u7f6e\u8bf4\u660e"))),(0,l.kt)("tbody",{parentName:"table"},(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"shenyu.sync.websocket.urls"),(0,l.kt)("td",{parentName:"tr",align:null},"\u8868\u793a\u7f51\u5173\u548cShenYu Admin\u4e4b\u95f4\u4f7f\u7528Websocket\u7684\u65b9\u5f0f\u8fdb\u884c\u6570\u636e\u540c\u6b65\uff0c\u8fd9\u91cc\u662f\u914d\u7f6eShenYu Admin\u7684\u63d0\u4f9b\u7684Websocket\u6570\u636e\u540c\u6b65\u670d\u52a1\u7684\u5730\u5740\uff08\u652f\u6301\u96c6\u7fa4\uff0c\u9017\u53f7\u5206\u5272\uff09\u3002")))),(0,l.kt)("div",{className:"admonition admonition-caution alert alert--warning"},(0,l.kt)("div",{parentName:"div",className:"admonition-heading"},(0,l.kt)("h5",{parentName:"div"},(0,l.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,l.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"16",height:"16",viewBox:"0 0 16 16"},(0,l.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M8.893 1.5c-.183-.31-.52-.5-.887-.5s-.703.19-.886.5L.138 13.499a.98.98 0 0 0 0 1.001c.193.31.53.501.886.501h13.964c.367 0 .704-.19.877-.5a1.03 1.03 0 0 0 .01-1.002L8.893 1.5zm.133 11.497H6.987v-2.003h2.039v2.003zm0-3.004H6.987V5.987h2.039v4.006z"}))),"caution")),(0,l.kt)("div",{parentName:"div",className:"admonition-content"},(0,l.kt)("p",{parentName:"div"},"\u4e0a\u8868\u4e2d\u63d0\u5230\u5230ShenYu Admin\u662fShenYu\u7f51\u5173\u6846\u67b6\u7684\u914d\u7f6e&\u5143\u6570\u636e\u7ba1\u7406\u540e\u53f0\u3002\u8fd9\u91cc\u5305\u542b\u4e86\u7f51\u5173\u6a21\u5757\u81ea\u5df1\u7684\u914d\u7f6e\u4fe1\u606f\u4e5f\u5305\u542b\u4e86\u540e\u53f0\u670d\u52a1\u63a5\u53e3\u539f\u6570\u636e\u4fe1\u606f\uff0c\u8fd9\u7406\u7684\u914d\u7f6e\u4fe1\u606f\u548c\u5143\u6570\u636e\u4fe1\u606f\u9700\u8981\u548c\u7f51\u5173\u6a21\u5757\u540c\u6b65\u3002ShenYu\u652f\u6301\u591a\u79cd\u6570\u636e\u540c\u6b65\u65b9\u6848\uff0cWebsocket\u53ea\u662f\u76d8\u53e4\u5f00\u53d1\u9009\u7528\u7684\u4e00\u79cd\u7f3a\u7701\u65b9\u6848\u3002\u5173\u4e8e\u7f51\u5173\u7684\u66f4\u591a\u4fe1\u606f\uff0c\u8bf7\u53c2\u9605:",(0,l.kt)("a",{parentName:"p",href:"/docs/advanced-guide/gateway"},"\u4f7f\u7528\u6307\u5357->\u7f51\u5173\u7cfb\u7edf"),"\u7ae0\u8282\u3002"))),(0,l.kt)("h3",{id:"\u8c03\u7528\u5fae\u670d\u52a1\u63a5\u53e3"},"\u8c03\u7528\u5fae\u670d\u52a1\u63a5\u53e3"),(0,l.kt)("p",null,"\u57fa\u4e8eShenYu\u7684\u7f51\u5173\u5f00\u53d1\u6a21\u5f0f\u65e2\u4e0d\u9700\u8981\u5f15\u5165\u670d\u52a1\u63a5\u53e3JAR\uff0c\u4e5f\u4e0d\u9700\u8981\u7f16\u5199\u5177\u4f53\u7684\u8c03\u7528\u4ee3\u7801\u3002\u5b8c\u5168\u7531\u7f51\u5173\u6839\u636e\u670d\u52a1\u63a5\u53e3\u5143\u6570\u636e\u8fdb\u884cDubbo\u6cdb\u5316\u8c03\u7528\u3002"),(0,l.kt)("div",{className:"admonition admonition-danger alert alert--danger"},(0,l.kt)("div",{parentName:"div",className:"admonition-heading"},(0,l.kt)("h5",{parentName:"div"},(0,l.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,l.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"12",height:"16",viewBox:"0 0 12 16"},(0,l.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M5.05.31c.81 2.17.41 3.38-.52 4.31C3.55 5.67 1.98 6.45.9 7.98c-1.45 2.05-1.7 6.53 3.53 7.7-2.2-1.16-2.67-4.52-.3-6.61-.61 2.03.53 3.33 1.94 2.86 1.39-.47 2.3.53 2.27 1.67-.02.78-.31 1.44-1.13 1.81 3.42-.59 4.78-3.42 4.78-5.56 0-2.84-2.53-3.22-1.25-5.61-1.52.13-2.03 1.13-1.89 2.75.09 1.08-1.02 1.8-1.86 1.33-.67-.41-.66-1.19-.06-1.78C8.18 5.31 8.68 2.45 5.05.32L5.03.3l.02.01z"}))),"\u90a3\u4e48\u95ee\u9898\u6765\u4e86\uff0c\u7f51\u5173\u662f\u5982\u4f55\u77e5\u9053Dubbo\u670d\u52a1\u63a5\u53e3\u5143\u6570\u636e\u7684\u5462\uff1f")),(0,l.kt)("div",{parentName:"div",className:"admonition-content"},(0,l.kt)("ul",{parentName:"div"},(0,l.kt)("li",{parentName:"ul"},"\u901a\u8fc7ShenYu Admin\u540e\u53f0\u7cfb\u7edf\uff0c\u300e\u57fa\u7840\u914d\u7f6e->\u5143\u6570\u636e\u7ba1\u7406\u300f\u83dc\u5355\uff0c\u624b\u5de5\u65b0\u589e\u6bcf\u4e00\u4e2a\u63a5\u53e3\u7684\u5143\u6570\u636e\uff0c\u7136\u540e\u5c06\u6570\u636e\u81ea\u52a8\u540c\u6b65\u5230\u7f51\u5173\u6a21\u5757\u3002\uff08\u4e0d\u5efa\u8bae\uff0c\u91cf\u5927\u7684\u8bdd\u592a\u7e41\u7410\uff09"),(0,l.kt)("li",{parentName:"ul"},"\u5bf9Dubbo\u670d\u52a1\u63d0\u4f9b\u8005\u589e\u52a0ShenYu Client\u652f\u6301\uff0c\u901a\u8fc7\u5728\u63a5\u53e3\u65b9\u6cd5\u4e0a\u4f7f\u7528\u6ce8\u89e3",(0,l.kt)("inlineCode",{parentName:"li"},"@ShenyuDubboClient"),"\u6765\u81ea\u52a8\u91c7\u96c6\u4e0a\u4f20\u63a5\u53e3\u5143\u6570\u636e\u5230ShenYu Admin\uff0c\u7136\u540e\u5c06\u6570\u636e\u81ea\u52a8\u540c\u6b65\u5230\u7f51\u5173\u6a21\u5757\u3002\uff08\u76d8\u53e4\u5f00\u53d1\u5efa\u8bae\u4f7f\u7528\u7684\u6807\u51c6\u59ff\u52bf\uff09\u5982\u4f55\u5bf9Dubbo\u670d\u52a1\u63d0\u4f9b\u8005\u589e\u52a0ShenYu Client\u652f\u6301\u8bf7\u53c2\u9605\u4e0b\u6587\u7684\u300e",(0,l.kt)("a",{parentName:"li",href:"#dubbo%E6%9C%8D%E5%8A%A1%E7%AB%AF%E7%BD%91%E5%85%B3%E9%87%87%E9%9B%86%E6%8E%A5%E5%8F%A3%E5%85%83%E6%95%B0%E6%8D%AE"},"Dubbo\u670d\u52a1\u7aef\uff08\u7f51\u5173\u91c7\u96c6\u63a5\u53e3\u5143\u6570\u636e\uff09"),"\u300f\u7ae0\u8282\u3002")))),(0,l.kt)("div",{className:"admonition admonition-info alert alert--info"},(0,l.kt)("div",{parentName:"div",className:"admonition-heading"},(0,l.kt)("h5",{parentName:"div"},(0,l.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,l.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"14",height:"16",viewBox:"0 0 14 16"},(0,l.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M7 2.3c3.14 0 5.7 2.56 5.7 5.7s-2.56 5.7-5.7 5.7A5.71 5.71 0 0 1 1.3 8c0-3.14 2.56-5.7 5.7-5.7zM7 1C3.14 1 0 4.14 0 8s3.14 7 7 7 7-3.14 7-7-3.14-7-7-7zm1 3H6v5h2V4zm0 6H6v2h2v-2z"}))),"\u8fd8\u6709\u4e00\u4e2a\u95ee\u9898\uff0c\u7f51\u5173\u8981\u5b9e\u73b0\u6cdb\u5316\u8c03\u7528\u662f\u9700\u8981dubbo\u670d\u52a1\u7684\u6ce8\u518c\u4e2d\u5fc3\u7684\uff1f")),(0,l.kt)("div",{parentName:"div",className:"admonition-content"},(0,l.kt)("ul",{parentName:"div"},(0,l.kt)("li",{parentName:"ul"},"\u6ca1\u9519\u3002\u901a\u8fc7ShenYu Admin\u540e\u53f0\u7cfb\u7edf\u300e\u57fa\u7840\u914d\u7f6e->\u63d2\u4ef6\u7ba1\u7406\u300f\u83dc\u5355\uff0c\u542f\u7528",(0,l.kt)("inlineCode",{parentName:"li"},"dubbo\u63d2\u4ef6"),"\u5e76\u586b\u5165\u6ce8\u518c\u4e2d\u5fc3\u5730\u5740\u3002\u6bd4\u5982\uff0c\u6211\u6d4b\u8bd5\u7528\u7684\u6ce8\u518c\u4e2d\u5fc3\u5730\u5740\uff1a",(0,l.kt)("inlineCode",{parentName:"li"},"nacos://169.188.88.140:1688?namespace=pangu-dev"),"\u3002\u5982\u4e0b\u56fe\u6240\u793a\u3002")))),(0,l.kt)("p",null,(0,l.kt)("img",{alt:"\u76d8\u53e4\u6846\u67b6\u7f51\u5173",src:t(8592).Z})),(0,l.kt)("h3",{id:"\u542f\u52a8\u5165\u53e3"},"\u542f\u52a8\u5165\u53e3"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx",metastring:"{4}","{4}":!0},"@SpringBootApplication\npublic class WebApiGatewayApplication {\n    public static void main(String[] args) {\n        PanGuApplicationBuilder.init(WebApiGatewayApplication.class).run(args);\n    }\n}\n")),(0,l.kt)("h2",{id:"dubbo\u670d\u52a1\u7aef\u7f51\u5173\u91c7\u96c6\u63a5\u53e3\u5143\u6570\u636e"},"Dubbo\u670d\u52a1\u7aef\uff08\u7f51\u5173\u91c7\u96c6\u63a5\u53e3\u5143\u6570\u636e\uff09"),(0,l.kt)("p",null,"\u7f51\u5173\u9700\u8981\u5bf9\u5176\u4ee3\u7406\u7684\u540e\u7aefDubbo\u670d\u52a1\u8fdb\u884c\u6cdb\u5316\u8c03\u7528\uff0c\u5c31\u5fc5\u987b\u77e5\u9053\u670d\u52a1\u63a5\u53e3\u5143\u6570\u636e\u3002\u4e0b\u6587\u5c31\u5c06\u5bf9\u4e00\u4e2a\u666e\u901aDubbo\u670d\u52a1\u5e94\u7528\u589e\u52a0ShenYu Client\u652f\u6301\u5b8c\u6210\u81ea\u52a8\u91c7\u96c6\u670d\u52a1\u63a5\u53e3\u5143\u6570\u636e\u529f\u80fd\u3002"),(0,l.kt)("h3",{id:"\u5b89\u88c5shenyu-client\u4f9d\u8d56\u5305"},"\u5b89\u88c5ShenYu Client\u4f9d\u8d56\u5305"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>org.apache.shenyu</groupId>\n    <artifactId>shenyu-spring-boot-starter-client-apache-dubbo</artifactId>\n</dependency>\n")),(0,l.kt)("h3",{id:"\u589e\u52a0\u914d\u7f6e\u9879"},"\u589e\u52a0\u914d\u7f6e\u9879"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"shenyu.client.register-type=http\nshenyu.client.server-lists=${shenyu.server-lists:http://localhost:9095}\nshenyu.client.props.contextPath=/dubbo\n")),(0,l.kt)("table",null,(0,l.kt)("thead",{parentName:"table"},(0,l.kt)("tr",{parentName:"thead"},(0,l.kt)("th",{parentName:"tr",align:null},"\u914d\u7f6e\u9879"),(0,l.kt)("th",{parentName:"tr",align:null},"\u914d\u7f6e\u8bf4\u660e"))),(0,l.kt)("tbody",{parentName:"table"},(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"shenyu.client.register-type"),(0,l.kt)("td",{parentName:"tr",align:null},"\u670d\u52a1\u63a5\u53e3\u5143\u6570\u636e\u91c7\u96c6\u65b9\u5f0f\uff0c\u53ef\u9009http\u76f4\u8fde\u6a21\u5f0f\u6216\u914d\u7f6e\u4e2d\u5fc3zookeeper\u3001etcd\u3001consul\u548cnacos\u3002\u76d8\u53e4\u5f00\u53d1\u91c7\u96c6\u63a5\u53e3\u5143\u6570\u636e\u7f3a\u7701\u9009\u62e9http\u76f4\u63a5ShenYu Admin\u7684\u65b9\u5f0f\u3002")),(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"shenyu.client.server-lists"),(0,l.kt)("td",{parentName:"tr",align:null},"ShenYu Admin\u5730\u5740\u6216\u914d\u7f6e\u4e2d\u5fc3\u5730\u5740\u3002\u96c6\u7fa4\u65f6\u591a\u4e2a\u5730\u5740\u7528\u9017\u53f7\u5206\u5f00\u3002")),(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"shenyu.client.props.contextPath"),(0,l.kt)("td",{parentName:"tr",align:null},"\u672c\u670d\u52a1\u5728\u7f51\u5173\u4e2d\u7684\u8def\u7531\u524d\u7f00,\u53ef\u81ea\u5b9a\u4e49\u6309\u9700\u914d\u7f6e")))),(0,l.kt)("h3",{id:"\u81ea\u52a8\u4e0a\u62a5\u670d\u52a1\u63a5\u53e3\u5143\u6570\u636e"},"\u81ea\u52a8\u4e0a\u62a5\u670d\u52a1\u63a5\u53e3\u5143\u6570\u636e"),(0,l.kt)("p",null,"\u5728Dubbo\u670d\u52a1\u5b9e\u73b0\u7c7b\u7684\u65b9\u6cd5\u4e0a\u4f7f\u7528\u6ce8\u89e3",(0,l.kt)("inlineCode",{parentName:"p"},"@ShenyuDubboClient"),"\u6807\u8bb0\uff0c\u8868\u793a\u8be5\u63a5\u53e3\u65b9\u6cd5\u5143\u6570\u636e\u81ea\u52a8\u4e0a\u4f20\u5230ShenYu Admin\u3002\u5982\u4e0b\u4ee3\u7801\u6240\u793a\u3002"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx",metastring:"{5,12}","{5,12}":!0},'@Service(version = "1.0.0", group = "pangu-examples-dubbo-gateway-service")\npublic class UserServiceImpl implements UserService {\n\n    @Override\n    @ShenyuDubboClient(path = "/findUserEntity", desc = "\u67e5\u8be2\u7528\u6237\u4fe1\u606f")\n    public UserEntity findUserEntity(Long id) {\n        ...\n        return userEntity;\n    }\n\n    @Override\n    @ShenyuDubboClient(path = "/listUserOuts", desc = "\u67e5\u8be2\u7528\u6237\u4fe1\u606f\u5217\u8868")\n    public List<UserOut> listUserOuts(UserIn userIn) {\n        ...\n        return userOuts;\n    }\n}\n')),(0,l.kt)("p",null,(0,l.kt)("strong",{parentName:"p"},"\u91cd\u542f\u670d\u52a1\u63d0\u4f9b\u8005\uff1a")),(0,l.kt)("ul",null,(0,l.kt)("li",{parentName:"ul"},"\u8fdb\u5165ShenYu Admin\u540e\u53f0\u7cfb\u7edf\u7684\u300e\u57fa\u7840\u914d\u7f6e->\u5143\u6570\u636e\u7ba1\u7406\u300f\u83dc\u5355\uff0c\u4f1a\u770b\u5230\u81ea\u52a8\u4e0a\u62a5\u7684\u670d\u52a1\u5143\u6570\u636e\u4fe1\u606f\u3002\u5982\u4e0b\u56fe\u6240\u793a\u3002\n",(0,l.kt)("img",{alt:"\u76d8\u53e4\u5f00\u53d1\u7f51\u5173",src:t(1536).Z})),(0,l.kt)("li",{parentName:"ul"},"\u8fdb\u5165ShenYu Admin\u540e\u53f0\u7cfb\u7edf\u7684\u300e\u63d2\u4ef6\u5217\u8868->proxy->dubbo\u300f\u83dc\u5355\uff0c\u4f1a\u770b\u5230\u81ea\u52a8\u6ce8\u518c\u7684\u9009\u62e9\u5668\u548c\u89c4\u5219\u4fe1\u606f\u3002\u5982\u4e0b\u56fe\u6240\u793a\u3002\n",(0,l.kt)("img",{alt:"\u76d8\u53e4\u5f00\u53d1\u7f51\u5173",src:t(7532).Z}))),(0,l.kt)("h2",{id:"\u5b8c\u6574\u8bf7\u6c42url\u53ca\u53c2\u6570\u8bf4\u660e"},"\u5b8c\u6574\u8bf7\u6c42URL\u53ca\u53c2\u6570\u8bf4\u660e"),(0,l.kt)("p",null,"\u81f3\u6b64\uff0c\u5c31\u53ef\u4ee5\u901a\u8fc7http\u7684\u65b9\u5f0f\u6765\u8bf7\u6c42\u6211\u4eec\u7684\u7684dubbo\u670d\u52a1\u4e86\u3002"),(0,l.kt)("h3",{id:"\u8bf7\u6c42url"},"\u8bf7\u6c42URL"),(0,l.kt)("div",{className:"admonition admonition-info alert alert--info"},(0,l.kt)("div",{parentName:"div",className:"admonition-heading"},(0,l.kt)("h5",{parentName:"div"},(0,l.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,l.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"14",height:"16",viewBox:"0 0 14 16"},(0,l.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M7 2.3c3.14 0 5.7 2.56 5.7 5.7s-2.56 5.7-5.7 5.7A5.71 5.71 0 0 1 1.3 8c0-3.14 2.56-5.7 5.7-5.7zM7 1C3.14 1 0 4.14 0 8s3.14 7 7 7 7-3.14 7-7-3.14-7-7-7zm1 3H6v5h2V4zm0 6H6v2h2v-2z"}))),"\u5982\u4f55\u786e\u5b9adubbo\u670d\u52a1\u5bf9\u5e94\u7684\u8bf7\u6c42url\u5730\u5740\u5462\uff1f")),(0,l.kt)("div",{parentName:"div",className:"admonition-content"},(0,l.kt)("p",{parentName:"div"},"\u7531\u7f51\u5173\u6a21\u5757\u914d\u7f6e\u6587\u4ef6\u53ef\u77e5\u7f51\u5173\u5e94\u7528\u7aef\u53e3\u662f",(0,l.kt)("inlineCode",{parentName:"p"},"9090"),"\uff0cdubbo\u670d\u52a1\u7684\u914d\u7f6e\u9879shenyu.client.props.contextPath\u4e3a",(0,l.kt)("inlineCode",{parentName:"p"},"/dubbo"),"\uff0c\u6211\u4eec\u7684dubbo\u65b9\u6cd5\u901a\u8fc7@ShenyuDubboClient\u6807\u8bb0\u7684path\u5c5e\u6027\u4e3a\uff1a",(0,l.kt)("inlineCode",{parentName:"p"},"/findUserEntity"),"\u3002\u7efc\u4e0a\uff0cdubbo\u670d\u52a1UserService#findUserEntity\u7684\u5b8c\u6574\u8bf7\u6c42\u5730\u5740\u4e3a\uff1ahttp://localhost:9090/dubbo/findUserEntity"))),(0,l.kt)("h3",{id:"\u53c2\u6570\u8bf4\u660e"},"\u53c2\u6570\u8bf4\u660e"),(0,l.kt)("p",null,"\u901a\u8fc7http\u534f\u8bae\uff0cpost\u65b9\u5f0f\u8bbf\u95ee\u7f51\u5173\u3002\u5728http body\u4e2d\u4f20\u5165json\u683c\u5f0f\u7684\u53c2\u6570\u3002"),(0,l.kt)("h3",{id:"\u8bf7\u6c42\u793a\u4f8b"},"\u8bf7\u6c42\u793a\u4f8b"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx",metastring:'title="CURL\u811a\u672c"',title:'"CURL\u811a\u672c"'},"curl --location --request POST 'http://127.0.0.1:9090/dubbo/findUserEntity' \\\n--header 'Content-Type: application/json' \\\n--data '{id=1}'\n")),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx",metastring:'title="\u8fd4\u56de\u7ed3\u679c"',title:'"\u8fd4\u56de\u7ed3\u679c"'},'{\n    "code": 200,\n    "message": "Access to success!",\n    "data": {\n        "name": "\u4e91\u5357\u7801\u519c\u5927\u718a",\n        "id": 1,\n        "userType": 2,\n    }\n}\n')),(0,l.kt)("h2",{id:"\u76f8\u5173\u53c2\u8003\u8303\u4f8b"},"\u76f8\u5173\u53c2\u8003\u8303\u4f8b"),(0,l.kt)("ul",null,(0,l.kt)("li",{parentName:"ul"},(0,l.kt)("a",{parentName:"li",href:"https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-dubbo-api"},"pangu-examples-dubbo-api"),"\uff1a\u670d\u52a1\u63a5\u53e3\u5305"),(0,l.kt)("li",{parentName:"ul"},(0,l.kt)("a",{parentName:"li",href:"https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-dubbo-gateway-service"},"pangu-examples-dubbo-gateway-service"),"\uff1a\u670d\u52a1\u63d0\u4f9b\u8005\uff08\u652f\u6301\u7f51\u5173\uff09"),(0,l.kt)("li",{parentName:"ul"},(0,l.kt)("a",{parentName:"li",href:"https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-webapi-gateway-based"},"pangu-examples-webapi-gateway-based"),"\uff1a\u670d\u52a1\u6d88\u8d39\u8005\uff08\u57fa\u4e8eShenYu\u7684\u7f51\u5173\u6a21\u5757\uff09")),(0,l.kt)("h2",{id:"\u4e0b\u4e00\u6b65"},"\u4e0b\u4e00\u6b65"),(0,l.kt)("p",null,"\u7ee7\u7eed\u9605\u8bfb\u5176\u5b83\u7ae0\u8282\u83b7\u53d6\u60a8\u60f3\u8981\u7684\u7b54\u6848\u6216\u901a\u8fc7\u6211\u4eec\u7684",(0,l.kt)("a",{parentName:"p",href:"/docs/community"},"\u5f00\u53d1\u8005\u793e\u533a"),"\u5bfb\u6c42\u66f4\u591a\u5e2e\u52a9\u3002"))}h.isMDXComponent=!0},1536:function(e,n,t){n.Z=t.p+"assets/images/2-pangu-framework-shenyu-metadata-b69293c799df617306c587fdcb78dd94.png"},7532:function(e,n,t){n.Z=t.p+"assets/images/3-pangu-framework-shenyu-plugin-3b3a6ed16d27836a25a2a7037423f553.png"},8592:function(e,n,t){n.Z=t.p+"assets/images/4-pangu-framework-shenyu-dubbo-8571bbae9d99ba6e3c2b539b5409af0b.png"}}]);