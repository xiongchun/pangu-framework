"use strict";(self.webpackChunkpangu_website=self.webpackChunkpangu_website||[]).push([[111],{3905:function(e,n,t){t.d(n,{Zo:function(){return s},kt:function(){return d}});var r=t(7294);function a(e,n,t){return n in e?Object.defineProperty(e,n,{value:t,enumerable:!0,configurable:!0,writable:!0}):e[n]=t,e}function o(e,n){var t=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);n&&(r=r.filter((function(n){return Object.getOwnPropertyDescriptor(e,n).enumerable}))),t.push.apply(t,r)}return t}function l(e){for(var n=1;n<arguments.length;n++){var t=null!=arguments[n]?arguments[n]:{};n%2?o(Object(t),!0).forEach((function(n){a(e,n,t[n])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(t)):o(Object(t)).forEach((function(n){Object.defineProperty(e,n,Object.getOwnPropertyDescriptor(t,n))}))}return e}function i(e,n){if(null==e)return{};var t,r,a=function(e,n){if(null==e)return{};var t,r,a={},o=Object.keys(e);for(r=0;r<o.length;r++)t=o[r],n.indexOf(t)>=0||(a[t]=e[t]);return a}(e,n);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);for(r=0;r<o.length;r++)t=o[r],n.indexOf(t)>=0||Object.prototype.propertyIsEnumerable.call(e,t)&&(a[t]=e[t])}return a}var u=r.createContext({}),c=function(e){var n=r.useContext(u),t=n;return e&&(t="function"==typeof e?e(n):l(l({},n),e)),t},s=function(e){var n=c(e.components);return r.createElement(u.Provider,{value:n},e.children)},p={inlineCode:"code",wrapper:function(e){var n=e.children;return r.createElement(r.Fragment,{},n)}},m=r.forwardRef((function(e,n){var t=e.components,a=e.mdxType,o=e.originalType,u=e.parentName,s=i(e,["components","mdxType","originalType","parentName"]),m=c(t),d=a,f=m["".concat(u,".").concat(d)]||m[d]||p[d]||o;return t?r.createElement(f,l(l({ref:n},s),{},{components:t})):r.createElement(f,l({ref:n},s))}));function d(e,n){var t=arguments,a=n&&n.mdxType;if("string"==typeof e||a){var o=t.length,l=new Array(o);l[0]=m;var i={};for(var u in n)hasOwnProperty.call(n,u)&&(i[u]=n[u]);i.originalType=e,i.mdxType="string"==typeof e?e:a,l[1]=i;for(var c=2;c<o;c++)l[c]=t[c];return r.createElement.apply(null,l)}return r.createElement.apply(null,t)}m.displayName="MDXCreateElement"},8545:function(e,n,t){t.r(n),t.d(n,{contentTitle:function(){return h},default:function(){return x},frontMatter:function(){return b},metadata:function(){return y},toc:function(){return k}});var r=t(7462),a=t(3366),o=t(7294),l=t(3905),i=t(2389),u=t(9443);var c=function(){var e=(0,o.useContext)(u.Z);if(null==e)throw new Error('"useUserPreferencesContext" is used outside of "Layout" component.');return e},s=t(3616),p=t(6010),m="tabItem_vU9c";function d(e){var n,t,r,a=e.lazy,l=e.block,i=e.defaultValue,u=e.values,d=e.groupId,f=e.className,v=o.Children.map(e.children,(function(e){if((0,o.isValidElement)(e)&&void 0!==e.props.value)return e;throw new Error("Docusaurus error: Bad <Tabs> child <"+("string"==typeof e.type?e.type:e.type.name)+'>: all children of the <Tabs> component should be <TabItem>, and every <TabItem> should have a unique "value" prop.')})),g=null!=u?u:v.map((function(e){var n=e.props;return{value:n.value,label:n.label}})),b=(0,s.lx)(g,(function(e,n){return e.value===n.value}));if(b.length>0)throw new Error('Docusaurus error: Duplicate values "'+b.map((function(e){return e.value})).join(", ")+'" found in <Tabs>. Every value needs to be unique.');var h=null===i?i:null!=(n=null!=i?i:null==(t=v.find((function(e){return e.props.default})))?void 0:t.props.value)?n:null==(r=v[0])?void 0:r.props.value;if(null!==h&&!g.some((function(e){return e.value===h})))throw new Error('Docusaurus error: The <Tabs> has a defaultValue "'+h+'" but none of its children has the corresponding value. Available values are: '+g.map((function(e){return e.value})).join(", ")+". If you intend to show no default tab, use defaultValue={null} instead.");var y=c(),k=y.tabGroupChoices,w=y.setTabGroupChoices,x=(0,o.useState)(h),N=x[0],O=x[1],T=[],E=(0,s.o5)().blockElementScrollPositionUntilNextRender;if(null!=d){var j=k[d];null!=j&&j!==N&&g.some((function(e){return e.value===j}))&&O(j)}var I=function(e){var n=e.currentTarget,t=T.indexOf(n),r=g[t].value;r!==N&&(E(n),O(r),null!=d&&w(d,r))},P=function(e){var n,t=null;switch(e.key){case"ArrowRight":var r=T.indexOf(e.currentTarget)+1;t=T[r]||T[0];break;case"ArrowLeft":var a=T.indexOf(e.currentTarget)-1;t=T[a]||T[T.length-1]}null==(n=t)||n.focus()};return o.createElement("div",{className:"tabs-container"},o.createElement("ul",{role:"tablist","aria-orientation":"horizontal",className:(0,p.Z)("tabs",{"tabs--block":l},f)},g.map((function(e){var n=e.value,t=e.label;return o.createElement("li",{role:"tab",tabIndex:N===n?0:-1,"aria-selected":N===n,className:(0,p.Z)("tabs__item",m,{"tabs__item--active":N===n}),key:n,ref:function(e){return T.push(e)},onKeyDown:P,onFocus:I,onClick:I},null!=t?t:n)}))),a?(0,o.cloneElement)(v.filter((function(e){return e.props.value===N}))[0],{className:"margin-vert--md"}):o.createElement("div",{className:"margin-vert--md"},v.map((function(e,n){return(0,o.cloneElement)(e,{key:n,hidden:e.props.value!==N})}))))}function f(e){var n=(0,i.Z)();return o.createElement(d,(0,r.Z)({key:String(n)},e))}var v=function(e){var n=e.children,t=e.hidden,r=e.className;return o.createElement("div",{role:"tabpanel",hidden:t,className:r},n)},g=["components"],b={title:"\u5b89\u88c5",tags:[],sidebar_position:2,slug:"/install"},h="\u76d8\u53e4\u6846\u67b6\u5b89\u88c5",y={unversionedId:"\u5b89\u88c5",id:"\u5b89\u88c5",title:"\u5b89\u88c5",description:"\u672c\u6587\u5c06\u4ecb\u7ecd\u5982\u4f55\u901a\u8fc7\u5305\u4f9d\u8d56\u7ba1\u7406\u5de5\u5177\u5b89\u88c5\u76d8\u53e4\u6846\u67b6\u3002",source:"@site/docs/\u5b89\u88c5.md",sourceDirName:".",slug:"/install",permalink:"/pangu-framework/docs/install",editUrl:"https://gitee.com/pulanos/pangu-framework/tree/master/pangu-website/docs/\u5b89\u88c5.md",tags:[],version:"current",sidebarPosition:2,frontMatter:{title:"\u5b89\u88c5",tags:[],sidebar_position:2,slug:"/install"},sidebar:"tutorialSidebar",previous:{title:"\u7b80\u4ecb",permalink:"/pangu-framework/docs/intro"},next:{title:"Create a Page",permalink:"/pangu-framework/docs/quick-start/create-a-page"}},k=[{value:"\u6a21\u5757pangu-parent",id:"\u6a21\u5757pangu-parent",children:[],level:2},{value:"\u6a21\u5757pangu-common",id:"\u6a21\u5757pangu-common",children:[],level:2},{value:"\u4e0b\u4e00\u6b65",id:"\u4e0b\u4e00\u6b65",children:[],level:2}],w={toc:k};function x(e){var n=e.components,t=(0,a.Z)(e,g);return(0,l.kt)("wrapper",(0,r.Z)({},w,t,{components:n,mdxType:"MDXLayout"}),(0,l.kt)("h1",{id:"\u76d8\u53e4\u6846\u67b6\u5b89\u88c5"},"\u76d8\u53e4\u6846\u67b6\u5b89\u88c5"),(0,l.kt)("div",{className:"admonition admonition-info alert alert--info"},(0,l.kt)("div",{parentName:"div",className:"admonition-heading"},(0,l.kt)("h5",{parentName:"div"},(0,l.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,l.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"14",height:"16",viewBox:"0 0 14 16"},(0,l.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M7 2.3c3.14 0 5.7 2.56 5.7 5.7s-2.56 5.7-5.7 5.7A5.71 5.71 0 0 1 1.3 8c0-3.14 2.56-5.7 5.7-5.7zM7 1C3.14 1 0 4.14 0 8s3.14 7 7 7 7-3.14 7-7-3.14-7-7-7zm1 3H6v5h2V4zm0 6H6v2h2v-2z"}))),"info")),(0,l.kt)("div",{parentName:"div",className:"admonition-content"},(0,l.kt)("p",{parentName:"div"},"\u672c\u6587\u5c06\u4ecb\u7ecd\u5982\u4f55\u901a\u8fc7\u5305\u4f9d\u8d56\u7ba1\u7406\u5de5\u5177\u5b89\u88c5\u76d8\u53e4\u6846\u67b6\u3002"))),(0,l.kt)("h2",{id:"\u6a21\u5757pangu-parent"},"\u6a21\u5757pangu-parent"),(0,l.kt)("p",null,"\u76d8\u53e4\u8d44\u6e90\u4f9d\u8d56\u58f0\u660e\u7ba1\u7406\u6a21\u5757\u3002\u6240\u6709\u76d8\u53e4\u5f15\u7528\u90fd\u5e94\u8be5\u4f9d\u8d56\u8fd9\u4e2a\u6a21\u5757\u3002"),(0,l.kt)(f,{mdxType:"Tabs"},(0,l.kt)(v,{value:"maven",label:"Maven\u5750\u6807",mdxType:"TabItem"},(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"<parent>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-parent</artifactId>\n    <version>latest.version.xxx</version>\n    <relativePath/>\n</parent>\n"))),(0,l.kt)(v,{value:"Gradle",label:"Gradle DSL",mdxType:"TabItem"},(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"implementation 'com.gitee.pulanos.pangu:pangu-parent:latest.version.xxx'\n")))),(0,l.kt)("h2",{id:"\u6a21\u5757pangu-common"},"\u6a21\u5757pangu-common"),(0,l.kt)("p",null,"\u76d8\u53e4\u516c\u5171\u57fa\u7840\u7c7b\u5e93\u3002\u4e0d\u7528\u663e\u5f0f\u5f15\u5165\uff0c\u5df2\u7ecf\u5728",(0,l.kt)("inlineCode",{parentName:"p"},"pangu-spring-boot-starter"),"\u4e2d\u4f9d\u8d56\u6b64\u6a21\u5757\u3002"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-xml",metastring:'title="pangu-common Maven\u5750\u6807"',title:'"pangu-common','Maven\u5750\u6807"':!0},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-common</artifactId>\n</dependency>\n")),(0,l.kt)("h2",{id:"\u4e0b\u4e00\u6b65"},"\u4e0b\u4e00\u6b65"),(0,l.kt)("p",null,"\u7ee7\u7eed\u9605\u8bfb\u5176\u5b83\u7ae0\u8282\u83b7\u53d6\u60a8\u60f3\u8981\u7684\u7b54\u6848\u6216\u901a\u8fc7\u6211\u4eec\u7684",(0,l.kt)("a",{parentName:"p",href:"/docs/community"},"\u5f00\u53d1\u8005\u793e\u533a"),"\u5bfb\u6c42\u66f4\u591a\u5e2e\u52a9\u3002"))}x.isMDXComponent=!0}}]);