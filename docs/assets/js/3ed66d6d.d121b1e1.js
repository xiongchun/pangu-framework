"use strict";(self.webpackChunkpangu_website=self.webpackChunkpangu_website||[]).push([[9143],{3905:function(e,t,n){n.d(t,{Zo:function(){return p},kt:function(){return d}});var r=n(7294);function a(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function o(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function l(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?o(Object(n),!0).forEach((function(t){a(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):o(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function u(e,t){if(null==e)return{};var n,r,a=function(e,t){if(null==e)return{};var n,r,a={},o=Object.keys(e);for(r=0;r<o.length;r++)n=o[r],t.indexOf(n)>=0||(a[n]=e[n]);return a}(e,t);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);for(r=0;r<o.length;r++)n=o[r],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(a[n]=e[n])}return a}var i=r.createContext({}),c=function(e){var t=r.useContext(i),n=t;return e&&(n="function"==typeof e?e(t):l(l({},t),e)),n},p=function(e){var t=c(e.components);return r.createElement(i.Provider,{value:t},e.children)},s={inlineCode:"code",wrapper:function(e){var t=e.children;return r.createElement(r.Fragment,{},t)}},m=r.forwardRef((function(e,t){var n=e.components,a=e.mdxType,o=e.originalType,i=e.parentName,p=u(e,["components","mdxType","originalType","parentName"]),m=c(n),d=a,f=m["".concat(i,".").concat(d)]||m[d]||s[d]||o;return n?r.createElement(f,l(l({ref:t},p),{},{components:n})):r.createElement(f,l({ref:t},p))}));function d(e,t){var n=arguments,a=t&&t.mdxType;if("string"==typeof e||a){var o=n.length,l=new Array(o);l[0]=m;var u={};for(var i in t)hasOwnProperty.call(t,i)&&(u[i]=t[i]);u.originalType=e,u.mdxType="string"==typeof e?e:a,l[1]=u;for(var c=2;c<o;c++)l[c]=n[c];return r.createElement.apply(null,l)}return r.createElement.apply(null,n)}m.displayName="MDXCreateElement"},8215:function(e,t,n){var r=n(7294);t.Z=function(e){var t=e.children,n=e.hidden,a=e.className;return r.createElement("div",{role:"tabpanel",hidden:n,className:a},t)}},6396:function(e,t,n){n.d(t,{Z:function(){return m}});var r=n(7462),a=n(7294),o=n(2389),l=n(9443);var u=function(){var e=(0,a.useContext)(l.Z);if(null==e)throw new Error('"useUserPreferencesContext" is used outside of "Layout" component.');return e},i=n(3616),c=n(6010),p="tabItem_vU9c";function s(e){var t,n,r,o=e.lazy,l=e.block,s=e.defaultValue,m=e.values,d=e.groupId,f=e.className,v=a.Children.map(e.children,(function(e){if((0,a.isValidElement)(e)&&void 0!==e.props.value)return e;throw new Error("Docusaurus error: Bad <Tabs> child <"+("string"==typeof e.type?e.type:e.type.name)+'>: all children of the <Tabs> component should be <TabItem>, and every <TabItem> should have a unique "value" prop.')})),g=null!=m?m:v.map((function(e){var t=e.props;return{value:t.value,label:t.label}})),b=(0,i.lx)(g,(function(e,t){return e.value===t.value}));if(b.length>0)throw new Error('Docusaurus error: Duplicate values "'+b.map((function(e){return e.value})).join(", ")+'" found in <Tabs>. Every value needs to be unique.');var k=null===s?s:null!=(t=null!=s?s:null==(n=v.find((function(e){return e.props.default})))?void 0:n.props.value)?t:null==(r=v[0])?void 0:r.props.value;if(null!==k&&!g.some((function(e){return e.value===k})))throw new Error('Docusaurus error: The <Tabs> has a defaultValue "'+k+'" but none of its children has the corresponding value. Available values are: '+g.map((function(e){return e.value})).join(", ")+". If you intend to show no default tab, use defaultValue={null} instead.");var h=u(),y=h.tabGroupChoices,w=h.setTabGroupChoices,x=(0,a.useState)(k),T=x[0],N=x[1],O=[],E=(0,i.o5)().blockElementScrollPositionUntilNextRender;if(null!=d){var I=y[d];null!=I&&I!==T&&g.some((function(e){return e.value===I}))&&N(I)}var j=function(e){var t=e.currentTarget,n=O.indexOf(t),r=g[n].value;r!==T&&(E(t),N(r),null!=d&&w(d,r))},P=function(e){var t,n=null;switch(e.key){case"ArrowRight":var r=O.indexOf(e.currentTarget)+1;n=O[r]||O[0];break;case"ArrowLeft":var a=O.indexOf(e.currentTarget)-1;n=O[a]||O[O.length-1]}null==(t=n)||t.focus()};return a.createElement("div",{className:"tabs-container"},a.createElement("ul",{role:"tablist","aria-orientation":"horizontal",className:(0,c.Z)("tabs",{"tabs--block":l},f)},g.map((function(e){var t=e.value,n=e.label;return a.createElement("li",{role:"tab",tabIndex:T===t?0:-1,"aria-selected":T===t,className:(0,c.Z)("tabs__item",p,{"tabs__item--active":T===t}),key:t,ref:function(e){return O.push(e)},onKeyDown:P,onFocus:j,onClick:j},null!=n?n:t)}))),o?(0,a.cloneElement)(v.filter((function(e){return e.props.value===T}))[0],{className:"margin-vert--md"}):a.createElement("div",{className:"margin-vert--md"},v.map((function(e,t){return(0,a.cloneElement)(e,{key:t,hidden:e.props.value!==T})}))))}function m(e){var t=(0,o.Z)();return a.createElement(s,(0,r.Z)({key:String(t)},e))}},6361:function(e,t,n){n.r(t),n.d(t,{frontMatter:function(){return c},contentTitle:function(){return p},metadata:function(){return s},toc:function(){return m},default:function(){return f}});var r=n(7462),a=n(3366),o=(n(7294),n(3905)),l=n(6396),u=n(8215),i=["components"],c={title:"\u5982\u4f55\u5f00\u53d1\u5355\u4f53\u5e94\u7528",tags:["\u5feb\u901f\u5f00\u59cb"],sidebar_position:15,slug:"/quick-start/how-to-make-monomer-architecture-app"},p=void 0,s={unversionedId:"quick-start/\u5982\u4f55\u5f00\u53d1\u5355\u4f53\u5e94\u7528",id:"quick-start/\u5982\u4f55\u5f00\u53d1\u5355\u4f53\u5e94\u7528",title:"\u5982\u4f55\u5f00\u53d1\u5355\u4f53\u5e94\u7528",description:"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6 | \u5982\u4f55\u5f00\u53d1\u5355\u4f53\u5e94\u7528",source:"@site/docs/quick-start/\u5982\u4f55\u5f00\u53d1\u5355\u4f53\u5e94\u7528.md",sourceDirName:"quick-start",slug:"/quick-start/how-to-make-monomer-architecture-app",permalink:"/pangu-framework/docs/quick-start/how-to-make-monomer-architecture-app",editUrl:"https://gitee.com/pulanos/pangu-framework/tree/master/pangu-website/docs/quick-start/\u5982\u4f55\u5f00\u53d1\u5355\u4f53\u5e94\u7528.md",tags:[{label:"\u5feb\u901f\u5f00\u59cb",permalink:"/pangu-framework/docs/tags/\u5feb\u901f\u5f00\u59cb"}],version:"current",sidebarPosition:15,frontMatter:{title:"\u5982\u4f55\u5f00\u53d1\u5355\u4f53\u5e94\u7528",tags:["\u5feb\u901f\u5f00\u59cb"],sidebar_position:15,slug:"/quick-start/how-to-make-monomer-architecture-app"},sidebar:"tutorialSidebar",previous:{title:"\u5f00\u53d1\u67b6\u6784\u6a21\u5f0f\u5bf9\u6bd4",permalink:"/pangu-framework/docs/quick-start/how-to-make-architecture"},next:{title:"\u5982\u4f55\u5f00\u53d1\u5fae\u670d\u52a1",permalink:"/pangu-framework/docs/quick-start/how-to-make-microservice-architecture-app"}},m=[{value:"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6a21\u5757",id:"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6a21\u5757",children:[],level:2},{value:"\u672c\u5730\u914d\u7f6e",id:"\u672c\u5730\u914d\u7f6e",children:[],level:2},{value:"\u542f\u52a8\u5165\u53e3",id:"\u542f\u52a8\u5165\u53e3",children:[],level:2},{value:"\u672c\u6587\u76f8\u5173\u8303\u4f8b\u6e90\u7801",id:"\u672c\u6587\u76f8\u5173\u8303\u4f8b\u6e90\u7801",children:[],level:2},{value:"\u4e0b\u4e00\u6b65",id:"\u4e0b\u4e00\u6b65",children:[],level:2}],d={toc:m};function f(e){var t=e.components,n=(0,a.Z)(e,i);return(0,o.kt)("wrapper",(0,r.Z)({},d,n,{components:t,mdxType:"MDXLayout"}),(0,o.kt)("head",null,(0,o.kt)("title",null,"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6 | \u5982\u4f55\u5f00\u53d1\u5355\u4f53\u5e94\u7528 "),(0,o.kt)("meta",{name:"keywords",content:"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6 | \u5982\u4f55\u5f00\u53d1\u5355\u4f53\u5e94\u7528"}),(0,o.kt)("meta",{name:"description",content:"\u300c\u76d8\u53e4\u5f00\u53d1\u6846\u67b6\u300d\u662f\u5b8c\u5168\u72ec\u7acb\u4e8e Spring Cloud \u751f\u6001\u7684\u4e00\u5957\u8f7b\u91cf\u7075\u6d3b\u3001\u6210\u719f\u53ef\u9760\u7684\u5de5\u4e1a\u7ea7\u5206\u5e03\u5f0f\u5fae\u670d\u52a1\u5f00\u53d1\u548c\u6cbb\u7406\u6846\u67b6\uff08\u517c\u5bb9\u5782\u76f4\u5355\u4f53\u5206\u5c42\u67b6\u6784)\u3002\u5b83\u57fa\u4e8e Apache-2.0 \u534f\u8bae\u5f00\u6e90\u53d1\u5e03\uff0c\u4e14\u662f\u514d\u8d39\u7684\u3002\u6211\u4eec\u5e0c\u671b\u4e0d\u4ec5\u662f\u5f00\u6e90\u7684\u53d7\u76ca\u8005\uff0c\u4e5f\u80fd\u6210\u4e3a\u5f00\u6e90\u7684\u8d21\u732e\u8005\uff0c\u4e0e\u5f00\u6e90\u793e\u533a\u4e00\u8d77\u300c\u5171\u5efa\u5171\u4eab\u5f00\u6e90\u751f\u6001\u300d\u3002"})),(0,o.kt)("p",null,"\u672c\u6587\u4ecb\u7ecd\u5982\u4f55\u57fa\u4e8e\u76d8\u53e4\u5f00\u53d1\u6846\u67b6\u5f00\u53d1\u4e00\u4e2a\u5355\u4f53\u5206\u5c42\u67b6\u6784\u7684\u5e94\u7528\u3002\u6587\u4e2d\u6240\u8ff0\u4ec5\u4e3a\u642d\u5efa\u4e00\u4e2a\u5355\u4f53\u5e94\u7528\u7684\u57fa\u672c\u6846\u67b6\uff0c\u589e\u52a0\u914d\u7f6e\u4e2d\u5fc3\u3001\u6570\u636e\u6301\u4e45\u5316\u3001\u7f13\u5b58\u7b49\u80fd\u529b\u8bf7\u53c2\u8003\u4f7f\u7528\u6307\u5357\u7684\u76f8\u5173\u7ae0\u8282\u3002"),(0,o.kt)("h2",{id:"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6a21\u5757"},"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6a21\u5757"),(0,o.kt)(l.Z,{mdxType:"Tabs"},(0,o.kt)(u.Z,{value:"parent",label:"\u76d8\u53e4 Parent",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"<parent>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-parent</artifactId>\n    <version>latest.version.xxx</version>\n    <relativePath/>\n</parent>\n"))),(0,o.kt)(u.Z,{value:"dependency1",label:"\u57fa\u7840\u6a21\u5757",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-spring-boot-starter</artifactId>\n</dependency>\n"))),(0,o.kt)(u.Z,{value:"dependency2",label:"Web\u6a21\u5757",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-web-spring-boot-starter</artifactId>\n</dependency>\n")))),(0,o.kt)("h2",{id:"\u672c\u5730\u914d\u7f6e"},"\u672c\u5730\u914d\u7f6e"),(0,o.kt)("blockquote",null,(0,o.kt)("p",{parentName:"blockquote"},"\u4e3a\u4fbf\u4e8e\u7406\u89e3\uff0c\u672c\u6587\u57fa\u4e8e\u672c\u5730\u914d\u7f6e\u7684\u65b9\u5f0f\u7f16\u5199\u3002\u82e5\u6539\u4e3a\u6807\u51c6\u7684 Nacos \u914d\u7f6e\u4e2d\u5fc3\u6a21\u5f0f\uff0c\u8bf7\u53c2\u9605\uff1a",(0,o.kt)("a",{parentName:"p",href:"/docs/advanced-guide/nacos-config-center"},"\u914d\u7f6e\u4e2d\u5fc3")," \u7ae0\u8282\u3002")),(0,o.kt)(l.Z,{mdxType:"Tabs"},(0,o.kt)(u.Z,{value:"application",label:"application.properties",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"spring.profiles.active=${spring.profiles.active:dev}\n"))),(0,o.kt)(u.Z,{value:"application-dev",label:"application-dev.properties",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"spring.application.name=pangu-examples-empty-web\nspring.jackson.time-zone=GMT+8\n\nlogging.level.root=INFO\nlogging.level.com.gitee.pulanos.pangu=INFO\n")))),(0,o.kt)("h2",{id:"\u542f\u52a8\u5165\u53e3"},"\u542f\u52a8\u5165\u53e3"),(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx",metastring:"{4}","{4}":!0},"@SpringBootApplication\npublic class EmptyWebPanguApplication {\n    public static void main(String[] args) {\n        PanGuApplicationBuilder.init(EmptyWebPanguApplication.class).run(args);\n    }\n}\n")),(0,o.kt)("h2",{id:"\u672c\u6587\u76f8\u5173\u8303\u4f8b\u6e90\u7801"},"\u672c\u6587\u76f8\u5173\u8303\u4f8b\u6e90\u7801"),(0,o.kt)("ul",null,(0,o.kt)("li",{parentName:"ul"},(0,o.kt)("a",{parentName:"li",href:"https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-empty-web"},"pangu-examples-empty-web"),"\uff1a\u5355\u4f53\u5206\u5c42Web\u5e94\u7528\u8303\u4f8b")),(0,o.kt)("h2",{id:"\u4e0b\u4e00\u6b65"},"\u4e0b\u4e00\u6b65"),(0,o.kt)("p",null,"\u7ee7\u7eed\u9605\u8bfb\u5176\u5b83\u7ae0\u8282\u83b7\u53d6\u4f60\u60f3\u8981\u7684\u7b54\u6848\u6216\u901a\u8fc7\u6211\u4eec\u7684 ",(0,o.kt)("a",{parentName:"p",href:"/docs/community"},"\u5f00\u53d1\u8005\u793e\u533a")," \u5bfb\u6c42\u66f4\u591a\u5e2e\u52a9\u3002"))}f.isMDXComponent=!0}}]);