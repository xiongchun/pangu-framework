"use strict";(self.webpackChunkpangu_website=self.webpackChunkpangu_website||[]).push([[111],{3905:function(e,a,n){n.d(a,{Zo:function(){return s},kt:function(){return m}});var t=n(7294);function r(e,a,n){return a in e?Object.defineProperty(e,a,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[a]=n,e}function l(e,a){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var t=Object.getOwnPropertySymbols(e);a&&(t=t.filter((function(a){return Object.getOwnPropertyDescriptor(e,a).enumerable}))),n.push.apply(n,t)}return n}function o(e){for(var a=1;a<arguments.length;a++){var n=null!=arguments[a]?arguments[a]:{};a%2?l(Object(n),!0).forEach((function(a){r(e,a,n[a])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):l(Object(n)).forEach((function(a){Object.defineProperty(e,a,Object.getOwnPropertyDescriptor(n,a))}))}return e}function p(e,a){if(null==e)return{};var n,t,r=function(e,a){if(null==e)return{};var n,t,r={},l=Object.keys(e);for(t=0;t<l.length;t++)n=l[t],a.indexOf(n)>=0||(r[n]=e[n]);return r}(e,a);if(Object.getOwnPropertySymbols){var l=Object.getOwnPropertySymbols(e);for(t=0;t<l.length;t++)n=l[t],a.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(r[n]=e[n])}return r}var u=t.createContext({}),i=function(e){var a=t.useContext(u),n=a;return e&&(n="function"==typeof e?e(a):o(o({},a),e)),n},s=function(e){var a=i(e.components);return t.createElement(u.Provider,{value:a},e.children)},c={inlineCode:"code",wrapper:function(e){var a=e.children;return t.createElement(t.Fragment,{},a)}},d=t.forwardRef((function(e,a){var n=e.components,r=e.mdxType,l=e.originalType,u=e.parentName,s=p(e,["components","mdxType","originalType","parentName"]),d=i(n),m=r,g=d["".concat(u,".").concat(m)]||d[m]||c[m]||l;return n?t.createElement(g,o(o({ref:a},s),{},{components:n})):t.createElement(g,o({ref:a},s))}));function m(e,a){var n=arguments,r=a&&a.mdxType;if("string"==typeof e||r){var l=n.length,o=new Array(l);o[0]=d;var p={};for(var u in a)hasOwnProperty.call(a,u)&&(p[u]=a[u]);p.originalType=e,p.mdxType="string"==typeof e?e:r,o[1]=p;for(var i=2;i<l;i++)o[i]=n[i];return t.createElement.apply(null,o)}return t.createElement.apply(null,n)}d.displayName="MDXCreateElement"},8545:function(e,a,n){n.r(a),n.d(a,{contentTitle:function(){return f},default:function(){return N},frontMatter:function(){return k},metadata:function(){return x},toc:function(){return y}});var t=n(7462),r=n(3366),l=n(7294),o=n(3905),p=n(2389),u=n(9443);var i=function(){var e=(0,l.useContext)(u.Z);if(null==e)throw new Error('"useUserPreferencesContext" is used outside of "Layout" component.');return e},s=n(3616),c=n(6010),d="tabItem_vU9c";function m(e){var a,n,t,r=e.lazy,o=e.block,p=e.defaultValue,u=e.values,m=e.groupId,g=e.className,v=l.Children.map(e.children,(function(e){if((0,l.isValidElement)(e)&&void 0!==e.props.value)return e;throw new Error("Docusaurus error: Bad <Tabs> child <"+("string"==typeof e.type?e.type:e.type.name)+'>: all children of the <Tabs> component should be <TabItem>, and every <TabItem> should have a unique "value" prop.')})),b=null!=u?u:v.map((function(e){var a=e.props;return{value:a.value,label:a.label}})),k=(0,s.lx)(b,(function(e,a){return e.value===a.value}));if(k.length>0)throw new Error('Docusaurus error: Duplicate values "'+k.map((function(e){return e.value})).join(", ")+'" found in <Tabs>. Every value needs to be unique.');var f=null===p?p:null!=(a=null!=p?p:null==(n=v.find((function(e){return e.props.default})))?void 0:n.props.value)?a:null==(t=v[0])?void 0:t.props.value;if(null!==f&&!b.some((function(e){return e.value===f})))throw new Error('Docusaurus error: The <Tabs> has a defaultValue "'+f+'" but none of its children has the corresponding value. Available values are: '+b.map((function(e){return e.value})).join(", ")+". If you intend to show no default tab, use defaultValue={null} instead.");var x=i(),y=x.tabGroupChoices,h=x.setTabGroupChoices,N=(0,l.useState)(f),T=N[0],w=N[1],I=[],j=(0,s.o5)().blockElementScrollPositionUntilNextRender;if(null!=m){var O=y[m];null!=O&&O!==T&&b.some((function(e){return e.value===O}))&&w(O)}var E=function(e){var a=e.currentTarget,n=I.indexOf(a),t=b[n].value;t!==T&&(j(a),w(t),null!=m&&h(m,t))},D=function(e){var a,n=null;switch(e.key){case"ArrowRight":var t=I.indexOf(e.currentTarget)+1;n=I[t]||I[0];break;case"ArrowLeft":var r=I.indexOf(e.currentTarget)-1;n=I[r]||I[I.length-1]}null==(a=n)||a.focus()};return l.createElement("div",{className:"tabs-container"},l.createElement("ul",{role:"tablist","aria-orientation":"horizontal",className:(0,c.Z)("tabs",{"tabs--block":o},g)},b.map((function(e){var a=e.value,n=e.label;return l.createElement("li",{role:"tab",tabIndex:T===a?0:-1,"aria-selected":T===a,className:(0,c.Z)("tabs__item",d,{"tabs__item--active":T===a}),key:a,ref:function(e){return I.push(e)},onKeyDown:D,onFocus:E,onClick:E},null!=n?n:a)}))),r?(0,l.cloneElement)(v.filter((function(e){return e.props.value===T}))[0],{className:"margin-vert--md"}):l.createElement("div",{className:"margin-vert--md"},v.map((function(e,a){return(0,l.cloneElement)(e,{key:a,hidden:e.props.value!==T})}))))}function g(e){var a=(0,p.Z)();return l.createElement(m,(0,t.Z)({key:String(a)},e))}var v=function(e){var a=e.children,n=e.hidden,t=e.className;return l.createElement("div",{role:"tabpanel",hidden:n,className:t},a)},b=["components"],k={title:"\u5b89\u88c5",tags:["\u76d8\u53e4\u7b80\u4ecb","\u76d8\u53e4\u67b6\u6784"],sidebar_position:2,slug:"/install"},f="\u76d8\u53e4\u6846\u67b6\u5b89\u88c5",x={unversionedId:"\u5b89\u88c5",id:"\u5b89\u88c5",title:"\u5b89\u88c5",description:"\u672c\u6587\u5c06\u4ecb\u7ecd\u5982\u4f55\u901a\u8fc7\u5305\u4f9d\u8d56\u7ba1\u7406\u5de5\u5177\u5b89\u88c5\u76d8\u53e4\u6846\u67b6\u3002",source:"@site/docs/\u5b89\u88c5.md",sourceDirName:".",slug:"/install",permalink:"/pangu-framework/docs/install",editUrl:"https://gitee.com/pulanos/pangu-framework/tree/master/pangu-website/docs/\u5b89\u88c5.md",tags:[{label:"\u76d8\u53e4\u7b80\u4ecb",permalink:"/pangu-framework/docs/tags/\u76d8\u53e4\u7b80\u4ecb"},{label:"\u76d8\u53e4\u67b6\u6784",permalink:"/pangu-framework/docs/tags/\u76d8\u53e4\u67b6\u6784"}],version:"current",sidebarPosition:2,frontMatter:{title:"\u5b89\u88c5",tags:["\u76d8\u53e4\u7b80\u4ecb","\u76d8\u53e4\u67b6\u6784"],sidebar_position:2,slug:"/install"},sidebar:"tutorialSidebar",previous:{title:"\u7b80\u4ecb",permalink:"/pangu-framework/docs/intro"},next:{title:"\u5982\u4f55\u9009\u62e9\u76d8\u53e4\u5f00\u53d1\u6a21\u5f0f\u67b6\u6784",permalink:"/pangu-framework/docs/quick-start/how-to-make-architecture"}},y=[{value:"\u6a21\u5757pangu-parent",id:"\u6a21\u5757pangu-parent",children:[],level:2},{value:"\u6a21\u5757pangu-common",id:"\u6a21\u5757pangu-common",children:[],level:2},{value:"\u6a21\u5757pangu-spring-boot-starter",id:"\u6a21\u5757pangu-spring-boot-starter",children:[],level:2},{value:"\u6a21\u5757pangu-dubbo-spring-boot-starter",id:"\u6a21\u5757pangu-dubbo-spring-boot-starter",children:[],level:2},{value:"\u6a21\u5757pangu-jdbc-spring-boot-starter",id:"\u6a21\u5757pangu-jdbc-spring-boot-starter",children:[],level:2},{value:"\u6a21\u5757pangu-cache-spring-boot-starter",id:"\u6a21\u5757pangu-cache-spring-boot-starter",children:[],level:2},{value:"\u6a21\u5757pangu-gateway-spring-boot-starter",id:"\u6a21\u5757pangu-gateway-spring-boot-starter",children:[],level:2},{value:"\u6a21\u5757pangu-web-spring-boot-starter",id:"\u6a21\u5757pangu-web-spring-boot-starter",children:[],level:2},{value:"\u6a21\u5757pangu-generator-maven-plugin",id:"\u6a21\u5757pangu-generator-maven-plugin",children:[],level:2},{value:"\u4e0b\u4e00\u6b65",id:"\u4e0b\u4e00\u6b65",children:[],level:2}],h={toc:y};function N(e){var a=e.components,n=(0,r.Z)(e,b);return(0,o.kt)("wrapper",(0,t.Z)({},h,n,{components:a,mdxType:"MDXLayout"}),(0,o.kt)("h1",{id:"\u76d8\u53e4\u6846\u67b6\u5b89\u88c5"},"\u76d8\u53e4\u6846\u67b6\u5b89\u88c5"),(0,o.kt)("div",{className:"admonition admonition-tip alert alert--success"},(0,o.kt)("div",{parentName:"div",className:"admonition-heading"},(0,o.kt)("h5",{parentName:"div"},(0,o.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,o.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"12",height:"16",viewBox:"0 0 12 16"},(0,o.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M6.5 0C3.48 0 1 2.19 1 5c0 .92.55 2.25 1 3 1.34 2.25 1.78 2.78 2 4v1h5v-1c.22-1.22.66-1.75 2-4 .45-.75 1-2.08 1-3 0-2.81-2.48-5-5.5-5zm3.64 7.48c-.25.44-.47.8-.67 1.11-.86 1.41-1.25 2.06-1.45 3.23-.02.05-.02.11-.02.17H5c0-.06 0-.13-.02-.17-.2-1.17-.59-1.83-1.45-3.23-.2-.31-.42-.67-.67-1.11C2.44 6.78 2 5.65 2 5c0-2.2 2.02-4 4.5-4 1.22 0 2.36.42 3.22 1.19C10.55 2.94 11 3.94 11 5c0 .66-.44 1.78-.86 2.48zM4 14h5c-.23 1.14-1.3 2-2.5 2s-2.27-.86-2.5-2z"}))),"tip")),(0,o.kt)("div",{parentName:"div",className:"admonition-content"},(0,o.kt)("p",{parentName:"div"},"\u672c\u6587\u5c06\u4ecb\u7ecd\u5982\u4f55\u901a\u8fc7\u5305\u4f9d\u8d56\u7ba1\u7406\u5de5\u5177\u5b89\u88c5\u76d8\u53e4\u6846\u67b6\u3002"))),(0,o.kt)("h2",{id:"\u6a21\u5757pangu-parent"},"\u6a21\u5757pangu-parent"),(0,o.kt)("p",null,"\u76d8\u53e4\u8d44\u6e90\u4f9d\u8d56\u58f0\u660e\u7ba1\u7406\u6a21\u5757\u3002\u6240\u6709\u76d8\u53e4\u5f15\u7528\u90fd\u5e94\u8be5\u4f9d\u8d56\u8fd9\u4e2a\u6a21\u5757\u3002"),(0,o.kt)(g,{mdxType:"Tabs"},(0,o.kt)(v,{value:"maven",label:"Maven\u5750\u6807",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"<parent>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-parent</artifactId>\n    <version>latest.version.xxx</version>\n    <relativePath/>\n</parent>\n"))),(0,o.kt)(v,{value:"Gradle",label:"Gradle DSL",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"implementation 'com.gitee.pulanos.pangu:pangu-parent:latest.version.xxx'\n")))),(0,o.kt)("h2",{id:"\u6a21\u5757pangu-common"},"\u6a21\u5757pangu-common"),(0,o.kt)("p",null,"\u76d8\u53e4\u516c\u5171\u57fa\u7840\u7c7b\u5e93\u3002\u4e0d\u9700\u8981\u663e\u5f0f\u5f15\u5165\uff0c\u5df2\u7ecf\u5728",(0,o.kt)("inlineCode",{parentName:"p"},"pangu-spring-boot-starter"),"\u4e2d\u4f9d\u8d56\u6b64\u6a21\u5757\u3002"),(0,o.kt)(g,{mdxType:"Tabs"},(0,o.kt)(v,{value:"maven",label:"Maven\u5750\u6807",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-common</artifactId>\n</dependency>\n"))),(0,o.kt)(v,{value:"Gradle",label:"Gradle DSL",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"implementation 'com.gitee.pulanos.pangu:pangu-common:latest.version.xxx'\n")))),(0,o.kt)("h2",{id:"\u6a21\u5757pangu-spring-boot-starter"},"\u6a21\u5757pangu-spring-boot-starter"),(0,o.kt)("p",null,"\u76d8\u53e4\u542f\u52a8\u3001\u4e2d\u5fc3\u5316\u914d\u7f6e\u3001\u52a8\u6001\u65e5\u5fd7\u7b49\u57fa\u7840\u80fd\u529b\u81ea\u52a8\u88c5\u914d\u6a21\u5757\u3002"),(0,o.kt)(g,{mdxType:"Tabs"},(0,o.kt)(v,{value:"maven",label:"Maven\u5750\u6807",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-spring-boot-starter</artifactId>\n</dependency>\n"))),(0,o.kt)(v,{value:"Gradle",label:"Gradle DSL",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"implementation 'com.gitee.pulanos.pangu:pangu-spring-boot-starter:latest.version.xxx'\n")))),(0,o.kt)("h2",{id:"\u6a21\u5757pangu-dubbo-spring-boot-starter"},"\u6a21\u5757pangu-dubbo-spring-boot-starter"),(0,o.kt)("p",null,"\u76d8\u53e4\u5fae\u670d\u52a1\u5f00\u53d1\u81ea\u52a8\u88c5\u914d\u6a21\u5757\u3002"),(0,o.kt)(g,{mdxType:"Tabs"},(0,o.kt)(v,{value:"maven",label:"Maven\u5750\u6807",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-dubbo-spring-boot-starter</artifactId>\n</dependency>\n"))),(0,o.kt)(v,{value:"Gradle",label:"Gradle DSL",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"implementation 'com.gitee.pulanos.pangu:pangu-dubbo-spring-boot-starter:latest.version.xxx'\n")))),(0,o.kt)("h2",{id:"\u6a21\u5757pangu-jdbc-spring-boot-starter"},"\u6a21\u5757pangu-jdbc-spring-boot-starter"),(0,o.kt)("p",null,"\u76d8\u53e4\u6570\u636e\u5e93\u6301\u4e45\u5316\u64cd\u4f5c\u81ea\u52a8\u88c5\u914d\u6a21\u5757\u3002"),(0,o.kt)(g,{mdxType:"Tabs"},(0,o.kt)(v,{value:"maven",label:"Maven\u5750\u6807",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-jdbc-spring-boot-starter</artifactId>\n</dependency>\n"))),(0,o.kt)(v,{value:"Gradle",label:"Gradle DSL",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"implementation 'com.gitee.pulanos.pangu:pangu-jdbc-spring-boot-starter:latest.version.xxx'\n")))),(0,o.kt)("h2",{id:"\u6a21\u5757pangu-cache-spring-boot-starter"},"\u6a21\u5757pangu-cache-spring-boot-starter"),(0,o.kt)("p",null,"\u76d8\u53e4\u7f13\u5b58\u5f00\u53d1\u81ea\u52a8\u88c5\u914d\u6a21\u5757\u3002"),(0,o.kt)(g,{mdxType:"Tabs"},(0,o.kt)(v,{value:"maven",label:"Maven\u5750\u6807",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-cache-spring-boot-starter</artifactId>\n</dependency>\n"))),(0,o.kt)(v,{value:"Gradle",label:"Gradle DSL",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"implementation 'com.gitee.pulanos.pangu:pangu-cache-spring-boot-starter:latest.version.xxx'\n")))),(0,o.kt)("h2",{id:"\u6a21\u5757pangu-gateway-spring-boot-starter"},"\u6a21\u5757pangu-gateway-spring-boot-starter"),(0,o.kt)("p",null,"\u76d8\u53e4\u7f51\u5173\u5f00\u53d1\u81ea\u52a8\u88c5\u914d\u6a21\u5757\u3002"),(0,o.kt)(g,{mdxType:"Tabs"},(0,o.kt)(v,{value:"maven",label:"Maven\u5750\u6807",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-gateway-spring-boot-starter</artifactId>\n</dependency>\n"))),(0,o.kt)(v,{value:"Gradle",label:"Gradle DSL",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"implementation 'com.gitee.pulanos.pangu:pangu-gateway-spring-boot-starter:latest.version.xxx'\n")))),(0,o.kt)("h2",{id:"\u6a21\u5757pangu-web-spring-boot-starter"},"\u6a21\u5757pangu-web-spring-boot-starter"),(0,o.kt)("p",null,"\u76d8\u53e4Web\u5e94\u7528\u81ea\u52a8\u88c5\u914d\u6a21\u5757\u3002"),(0,o.kt)(g,{mdxType:"Tabs"},(0,o.kt)(v,{value:"maven",label:"Maven\u5750\u6807",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-web-spring-boot-starter</artifactId>\n</dependency>\n"))),(0,o.kt)(v,{value:"Gradle",label:"Gradle DSL",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"implementation 'com.gitee.pulanos.pangu:pangu-web-spring-boot-starter:latest.version.xxx'\n")))),(0,o.kt)("h2",{id:"\u6a21\u5757pangu-generator-maven-plugin"},"\u6a21\u5757pangu-generator-maven-plugin"),(0,o.kt)("p",null,"\u76d8\u53e4\u4ee3\u7801\u751f\u6210\u5668Maven\u63d2\u4ef6\u3002"),(0,o.kt)(g,{mdxType:"Tabs"},(0,o.kt)(v,{value:"maven",label:"Maven\u5750\u6807",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-generator-maven-plugin</artifactId>\n</dependency>\n"))),(0,o.kt)(v,{value:"Gradle",label:"Gradle DSL",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"implementation 'com.gitee.pulanos.pangu:pangu-generator-maven-plugin:latest.version.xxx'\n")))),(0,o.kt)("div",{className:"admonition admonition-danger alert alert--danger"},(0,o.kt)("div",{parentName:"div",className:"admonition-heading"},(0,o.kt)("h5",{parentName:"div"},(0,o.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,o.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"12",height:"16",viewBox:"0 0 12 16"},(0,o.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M5.05.31c.81 2.17.41 3.38-.52 4.31C3.55 5.67 1.98 6.45.9 7.98c-1.45 2.05-1.7 6.53 3.53 7.7-2.2-1.16-2.67-4.52-.3-6.61-.61 2.03.53 3.33 1.94 2.86 1.39-.47 2.3.53 2.27 1.67-.02.78-.31 1.44-1.13 1.81 3.42-.59 4.78-3.42 4.78-5.56 0-2.84-2.53-3.22-1.25-5.61-1.52.13-2.03 1.13-1.89 2.75.09 1.08-1.02 1.8-1.86 1.33-.67-.41-.66-1.19-.06-1.78C8.18 5.31 8.68 2.45 5.05.32L5.03.3l.02.01z"}))),"danger")),(0,o.kt)("div",{parentName:"div",className:"admonition-content"},(0,o.kt)("p",{parentName:"div"},"\u8bf7\u5c06\u4e0a\u8ff0\u7248\u672c\u53f7",(0,o.kt)("inlineCode",{parentName:"p"},"latest.version.xxx"),"\u66ff\u6362\u4e3a\u5f53\u524d\u53d1\u5e03\u7684\u6700\u65b0\u7248\u672c\uff0c\u5982\uff1a",(0,o.kt)("inlineCode",{parentName:"p"},"5.0.7"),"\u6216\u66f4\u65b0\u7248\u672c\u3002"))),(0,o.kt)("h2",{id:"\u4e0b\u4e00\u6b65"},"\u4e0b\u4e00\u6b65"),(0,o.kt)("p",null,"\u7ee7\u7eed\u9605\u8bfb\u5176\u5b83\u7ae0\u8282\u83b7\u53d6\u60a8\u60f3\u8981\u7684\u7b54\u6848\u6216\u901a\u8fc7\u6211\u4eec\u7684",(0,o.kt)("a",{parentName:"p",href:"/docs/community"},"\u5f00\u53d1\u8005\u793e\u533a"),"\u5bfb\u6c42\u66f4\u591a\u5e2e\u52a9\u3002"))}N.isMDXComponent=!0}}]);