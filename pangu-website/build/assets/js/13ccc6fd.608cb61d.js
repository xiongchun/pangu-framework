"use strict";(self.webpackChunkpangu_website=self.webpackChunkpangu_website||[]).push([[8098],{3905:function(e,n,t){t.d(n,{Zo:function(){return s},kt:function(){return m}});var a=t(7294);function r(e,n,t){return n in e?Object.defineProperty(e,n,{value:t,enumerable:!0,configurable:!0,writable:!0}):e[n]=t,e}function o(e,n){var t=Object.keys(e);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);n&&(a=a.filter((function(n){return Object.getOwnPropertyDescriptor(e,n).enumerable}))),t.push.apply(t,a)}return t}function l(e){for(var n=1;n<arguments.length;n++){var t=null!=arguments[n]?arguments[n]:{};n%2?o(Object(t),!0).forEach((function(n){r(e,n,t[n])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(t)):o(Object(t)).forEach((function(n){Object.defineProperty(e,n,Object.getOwnPropertyDescriptor(t,n))}))}return e}function i(e,n){if(null==e)return{};var t,a,r=function(e,n){if(null==e)return{};var t,a,r={},o=Object.keys(e);for(a=0;a<o.length;a++)t=o[a],n.indexOf(t)>=0||(r[t]=e[t]);return r}(e,n);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);for(a=0;a<o.length;a++)t=o[a],n.indexOf(t)>=0||Object.prototype.propertyIsEnumerable.call(e,t)&&(r[t]=e[t])}return r}var u=a.createContext({}),p=function(e){var n=a.useContext(u),t=n;return e&&(t="function"==typeof e?e(n):l(l({},n),e)),t},s=function(e){var n=p(e.components);return a.createElement(u.Provider,{value:n},e.children)},c={inlineCode:"code",wrapper:function(e){var n=e.children;return a.createElement(a.Fragment,{},n)}},d=a.forwardRef((function(e,n){var t=e.components,r=e.mdxType,o=e.originalType,u=e.parentName,s=i(e,["components","mdxType","originalType","parentName"]),d=p(t),m=r,g=d["".concat(u,".").concat(m)]||d[m]||c[m]||o;return t?a.createElement(g,l(l({ref:n},s),{},{components:t})):a.createElement(g,l({ref:n},s))}));function m(e,n){var t=arguments,r=n&&n.mdxType;if("string"==typeof e||r){var o=t.length,l=new Array(o);l[0]=d;var i={};for(var u in n)hasOwnProperty.call(n,u)&&(i[u]=n[u]);i.originalType=e,i.mdxType="string"==typeof e?e:r,l[1]=i;for(var p=2;p<o;p++)l[p]=t[p];return a.createElement.apply(null,l)}return a.createElement.apply(null,t)}d.displayName="MDXCreateElement"},8215:function(e,n,t){var a=t(7294);n.Z=function(e){var n=e.children,t=e.hidden,r=e.className;return a.createElement("div",{role:"tabpanel",hidden:t,className:r},n)}},6396:function(e,n,t){t.d(n,{Z:function(){return d}});var a=t(7462),r=t(7294),o=t(2389),l=t(9443);var i=function(){var e=(0,r.useContext)(l.Z);if(null==e)throw new Error('"useUserPreferencesContext" is used outside of "Layout" component.');return e},u=t(3616),p=t(6010),s="tabItem_vU9c";function c(e){var n,t,a,o=e.lazy,l=e.block,c=e.defaultValue,d=e.values,m=e.groupId,g=e.className,v=r.Children.map(e.children,(function(e){if((0,r.isValidElement)(e)&&void 0!==e.props.value)return e;throw new Error("Docusaurus error: Bad <Tabs> child <"+("string"==typeof e.type?e.type:e.type.name)+'>: all children of the <Tabs> component should be <TabItem>, and every <TabItem> should have a unique "value" prop.')})),b=null!=d?d:v.map((function(e){var n=e.props;return{value:n.value,label:n.label}})),f=(0,u.lx)(b,(function(e,n){return e.value===n.value}));if(f.length>0)throw new Error('Docusaurus error: Duplicate values "'+f.map((function(e){return e.value})).join(", ")+'" found in <Tabs>. Every value needs to be unique.');var k=null===c?c:null!=(n=null!=c?c:null==(t=v.find((function(e){return e.props.default})))?void 0:t.props.value)?n:null==(a=v[0])?void 0:a.props.value;if(null!==k&&!b.some((function(e){return e.value===k})))throw new Error('Docusaurus error: The <Tabs> has a defaultValue "'+k+'" but none of its children has the corresponding value. Available values are: '+b.map((function(e){return e.value})).join(", ")+". If you intend to show no default tab, use defaultValue={null} instead.");var h=i(),y=h.tabGroupChoices,w=h.setTabGroupChoices,N=(0,r.useState)(k),x=N[0],I=N[1],T=[],O=(0,u.o5)().blockElementScrollPositionUntilNextRender;if(null!=m){var C=y[m];null!=C&&C!==x&&b.some((function(e){return e.value===C}))&&I(C)}var j=function(e){var n=e.currentTarget,t=T.indexOf(n),a=b[t].value;a!==x&&(O(n),I(a),null!=m&&w(m,a))},E=function(e){var n,t=null;switch(e.key){case"ArrowRight":var a=T.indexOf(e.currentTarget)+1;t=T[a]||T[0];break;case"ArrowLeft":var r=T.indexOf(e.currentTarget)-1;t=T[r]||T[T.length-1]}null==(n=t)||n.focus()};return r.createElement("div",{className:"tabs-container"},r.createElement("ul",{role:"tablist","aria-orientation":"horizontal",className:(0,p.Z)("tabs",{"tabs--block":l},g)},b.map((function(e){var n=e.value,t=e.label;return r.createElement("li",{role:"tab",tabIndex:x===n?0:-1,"aria-selected":x===n,className:(0,p.Z)("tabs__item",s,{"tabs__item--active":x===n}),key:n,ref:function(e){return T.push(e)},onKeyDown:E,onFocus:j,onClick:j},null!=t?t:n)}))),o?(0,r.cloneElement)(v.filter((function(e){return e.props.value===x}))[0],{className:"margin-vert--md"}):r.createElement("div",{className:"margin-vert--md"},v.map((function(e,n){return(0,r.cloneElement)(e,{key:n,hidden:e.props.value!==x})}))))}function d(e){var n=(0,o.Z)();return r.createElement(c,(0,a.Z)({key:String(n)},e))}},5995:function(e,n,t){t.r(n),t.d(n,{frontMatter:function(){return p},contentTitle:function(){return s},metadata:function(){return c},toc:function(){return d},default:function(){return g}});var a=t(7462),r=t(3366),o=(t(7294),t(3905)),l=t(6396),i=t(8215),u=["components"],p={title:"\u5982\u4f55\u5f00\u53d1\u7f51\u5173\uff08SpringMVC\uff09",tags:["\u5feb\u901f\u5f00\u59cb","\u7f51\u5173"],sidebar_position:40,slug:"/quick-start/how-to-make-gateway-app/springmvc-based"},s="\u57fa\u4e8eSpringMVC\u7b80\u5355\u201c\u7f51\u5173\u201d\u5f00\u53d1",c={unversionedId:"quick-start/\u7f51\u5173\u7b80\u5355\u6a21\u5f0f",id:"quick-start/\u7f51\u5173\u7b80\u5355\u6a21\u5f0f",title:"\u5982\u4f55\u5f00\u53d1\u7f51\u5173\uff08SpringMVC\uff09",description:"\u7f51\u5173\u5f00\u53d1\u6a21\u5f0f\u9009\u578b\u53c2\u8003\u5efa\u8bae\u8bf7\u770b\u4e0a\u6587\u300a\u7f51\u5173\u5f00\u53d1\u6a21\u5f0f\u7b80\u4ecb\u300b\u3002",source:"@site/docs/quick-start/\u7f51\u5173\u7b80\u5355\u6a21\u5f0f.md",sourceDirName:"quick-start",slug:"/quick-start/how-to-make-gateway-app/springmvc-based",permalink:"/pangu-framework/docs/quick-start/how-to-make-gateway-app/springmvc-based",editUrl:"https://gitee.com/pulanos/pangu-framework/tree/master/pangu-website/docs/quick-start/\u7f51\u5173\u7b80\u5355\u6a21\u5f0f.md",tags:[{label:"\u5feb\u901f\u5f00\u59cb",permalink:"/pangu-framework/docs/tags/\u5feb\u901f\u5f00\u59cb"},{label:"\u7f51\u5173",permalink:"/pangu-framework/docs/tags/\u7f51\u5173"}],version:"current",sidebarPosition:40,frontMatter:{title:"\u5982\u4f55\u5f00\u53d1\u7f51\u5173\uff08SpringMVC\uff09",tags:["\u5feb\u901f\u5f00\u59cb","\u7f51\u5173"],sidebar_position:40,slug:"/quick-start/how-to-make-gateway-app/springmvc-based"},sidebar:"tutorialSidebar",previous:{title:"\u7f51\u5173\u5f00\u53d1\u6a21\u5f0f\u7b80\u4ecb",permalink:"/pangu-framework/docs/quick-start/how-to-make-gateway-app"},next:{title:"\u5982\u4f55\u5f00\u53d1\u7f51\u5173\uff08ShenYu\uff09",permalink:"/pangu-framework/docs/quick-start/how-to-make-gateway-app/shenyu-based"}},d=[{value:"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6846\u67b6\u6a21\u5757",id:"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6846\u67b6\u6a21\u5757",children:[],level:2},{value:"\u672c\u5730\u914d\u7f6e",id:"\u672c\u5730\u914d\u7f6e",children:[],level:2},{value:"\u8c03\u7528\u5fae\u670d\u52a1\u63a5\u53e3",id:"\u8c03\u7528\u5fae\u670d\u52a1\u63a5\u53e3",children:[],level:2},{value:"\u542f\u52a8\u5165\u53e3",id:"\u542f\u52a8\u5165\u53e3",children:[],level:2},{value:"\u5b8c\u6574\u8bf7\u6c42URL\u53ca\u53c2\u6570\u8bf4\u660e",id:"\u5b8c\u6574\u8bf7\u6c42url\u53ca\u53c2\u6570\u8bf4\u660e",children:[],level:2},{value:"\u76f8\u5173\u53c2\u8003\u8303\u4f8b",id:"\u76f8\u5173\u53c2\u8003\u8303\u4f8b",children:[],level:2},{value:"\u4e0b\u4e00\u6b65",id:"\u4e0b\u4e00\u6b65",children:[],level:2}],m={toc:d};function g(e){var n=e.components,t=(0,r.Z)(e,u);return(0,o.kt)("wrapper",(0,a.Z)({},m,t,{components:n,mdxType:"MDXLayout"}),(0,o.kt)("h1",{id:"\u57fa\u4e8espringmvc\u7b80\u5355\u7f51\u5173\u5f00\u53d1"},"\u57fa\u4e8eSpringMVC\u7b80\u5355\u201c\u7f51\u5173\u201d\u5f00\u53d1"),(0,o.kt)("p",null,"\u7f51\u5173\u5f00\u53d1\u6a21\u5f0f\u9009\u578b\u53c2\u8003\u5efa\u8bae\u8bf7\u770b\u4e0a\u6587",(0,o.kt)("a",{parentName:"p",href:"/docs/quick-start/how-to-make-gateway-app"},"\u300a\u7f51\u5173\u5f00\u53d1\u6a21\u5f0f\u7b80\u4ecb\u300b"),"\u3002"),(0,o.kt)("h2",{id:"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6846\u67b6\u6a21\u5757"},"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6846\u67b6\u6a21\u5757"),(0,o.kt)(l.Z,{mdxType:"Tabs"},(0,o.kt)(i.Z,{value:"parent",label:"\u76d8\u53e4Parent",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"<parent>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-parent</artifactId>\n    <version>latest.version.xxx</version>\n    <relativePath/>\n</parent>\n"))),(0,o.kt)(i.Z,{value:"dependency1",label:"\u57fa\u7840\u6a21\u5757",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-spring-boot-starter</artifactId>\n</dependency>\n"))),(0,o.kt)(i.Z,{value:"dependency2",label:"Dubbo\u6a21\u5757",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-dubbo-spring-boot-starter</artifactId>\n</dependency>\n"))),(0,o.kt)(i.Z,{value:"dependency3",label:"Web\u6a21\u5757",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-web-spring-boot-starter</artifactId>\n</dependency>\n"))),(0,o.kt)(i.Z,{value:"dependency4",label:"\u670d\u52a1\u63a5\u53e3\u5305",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-examples-dubbo-api</artifactId>\n    <version>1.0.0</version>\n</dependency>\n")))),(0,o.kt)("div",{className:"admonition admonition-tip alert alert--success"},(0,o.kt)("div",{parentName:"div",className:"admonition-heading"},(0,o.kt)("h5",{parentName:"div"},(0,o.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,o.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"12",height:"16",viewBox:"0 0 12 16"},(0,o.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M6.5 0C3.48 0 1 2.19 1 5c0 .92.55 2.25 1 3 1.34 2.25 1.78 2.78 2 4v1h5v-1c.22-1.22.66-1.75 2-4 .45-.75 1-2.08 1-3 0-2.81-2.48-5-5.5-5zm3.64 7.48c-.25.44-.47.8-.67 1.11-.86 1.41-1.25 2.06-1.45 3.23-.02.05-.02.11-.02.17H5c0-.06 0-.13-.02-.17-.2-1.17-.59-1.83-1.45-3.23-.2-.31-.42-.67-.67-1.11C2.44 6.78 2 5.65 2 5c0-2.2 2.02-4 4.5-4 1.22 0 2.36.42 3.22 1.19C10.55 2.94 11 3.94 11 5c0 .66-.44 1.78-.86 2.48zM4 14h5c-.23 1.14-1.3 2-2.5 2s-2.27-.86-2.5-2z"}))),"tip")),(0,o.kt)("div",{parentName:"div",className:"admonition-content"},(0,o.kt)("p",{parentName:"div"},"\u57fa\u4e8eSpringMVC\u7684\u7f51\u5173\u5f00\u53d1\u6a21\u5f0f\u9700\u8981\u5f15\u5165\u670d\u52a1\u63a5\u53e3\u4f9d\u8d56\u5305\u3002"))),(0,o.kt)("h2",{id:"\u672c\u5730\u914d\u7f6e"},"\u672c\u5730\u914d\u7f6e"),(0,o.kt)("blockquote",null,(0,o.kt)("p",{parentName:"blockquote"},"\u4e3a\u4fbf\u4e8e\u7406\u89e3\uff0c\u672c\u6587\u57fa\u4e8e\u672c\u5730\u914d\u7f6e\u7684\u65b9\u5f0f\u7f16\u5199\u3002\u82e5\u6539\u4e3a\u6807\u51c6\u7684Nacos\u914d\u7f6e\u4e2d\u5fc3\u6a21\u5f0f\uff0c\u8bf7\u53c2\u9605:",(0,o.kt)("a",{parentName:"p",href:"/docs/advanced-guide/nacos-config-center"},"\u4f7f\u7528\u6307\u5357->\u914d\u7f6e\u4e2d\u5fc3"),"\u7ae0\u8282\u3002")),(0,o.kt)(l.Z,{mdxType:"Tabs"},(0,o.kt)(i.Z,{value:"application",label:"application.properties",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx"},"spring.profiles.active=${spring.profiles.active:dev}\n"))),(0,o.kt)(i.Z,{value:"application-dev",label:"application-dev.properties",mdxType:"TabItem"},(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx",metastring:"{7}","{7}":!0},"spring.application.name=pangu-examples-dubbo-service\n\ndubbo.protocol.name=dubbo\ndubbo.protocol.port=20880\ndubbo.consumer.timeout=5000\n#\u670d\u52a1\u6ce8\u518c\u4e2d\u5fc3\u5730\u5740\ndubbo.registry.address=nacos://${nacos.server-addr}?namespace=${nacos.namespace}\ndubbo.consumer.check=false\n\nlogging.level.root=INFO\nlogging.level.com.gitee.pulanos.pangu=INFO\n")))),(0,o.kt)("h2",{id:"\u8c03\u7528\u5fae\u670d\u52a1\u63a5\u53e3"},"\u8c03\u7528\u5fae\u670d\u52a1\u63a5\u53e3"),(0,o.kt)("p",null,"\u53ef\u4ee5\u5728\u4efb\u4f55\u4e00\u4e2aSpringBean\u7ec4\u4ef6\u4e2d\uff08\u9488\u5bf9\u7f51\u5173\u6a21\u5757\u800c\u8a00\u4e00\u822c\u662fController\u4e2d\uff09\uff0c\u5f15\u5165\u670d\u52a1\u63a5\u53e3\u540e\u5c31\u50cf\u672c\u5730\u63a5\u53e3\u8c03\u7528\u4e00\u6837\u8c03\u7528\u8fdc\u7a0b\u670d\u52a1\u3002Dubbo\u5c06\u63d0\u4f9b\u9ad8\u6027\u80fd\u7684\u57fa\u4e8e\u4ee3\u7406\u7684\u8fdc\u7a0b\u8c03\u7528\u80fd\u529b\uff0c\u670d\u52a1\u4ee5\u63a5\u53e3\u4e3a\u7c92\u5ea6\uff0c\u4e3a\u5f00\u53d1\u8005\u5c4f\u853d\u8fdc\u7a0b\u8c03\u7528\u5e95\u5c42\u7ec6\u8282\u3002\n\u5982\u4e0b\u6240\u793a\uff0c\u901a\u8fc7Cotroller\u8c03\u7528\u8fdc\u7a0b\u670d\u52a1\u63a5\u53e3\uff0c\u5b9e\u73b0\u5c06\u5fae\u670d\u52a1\u63a5\u53e3\u53d1\u5e03\u4e3aWebAPI\u3002"),(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx",metastring:'{2,13} title="DemoController.java"',"{2,13}":!0,title:'"DemoController.java"'},'// \u6ce8\u5165\u670d\u52a1\u63a5\u53e3\n@Reference(version = "1.0.0", group = "pangu-examples-dubbo-service")\nprivate UserService userService;\n\n/**\n * \u901a\u8fc7SpringMVC\u5c06Duboo\u5fae\u670d\u52a1\u63a5\u53e3\u53d1\u5e03\u4e3aWebAPI\n * @return\n */\n@RequestMapping("/case1")\npublic Result<List<UserOut>> case1() {\n    log.info("call case1...");\n    UserIn userIn = new UserIn().setUserType("1");\n    List<UserOut> userOuts = userService.listUserOuts(userIn);\n    return Result.success(userOuts);\n}\n')),(0,o.kt)("div",{className:"admonition admonition-caution alert alert--warning"},(0,o.kt)("div",{parentName:"div",className:"admonition-heading"},(0,o.kt)("h5",{parentName:"div"},(0,o.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,o.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"16",height:"16",viewBox:"0 0 16 16"},(0,o.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M8.893 1.5c-.183-.31-.52-.5-.887-.5s-.703.19-.886.5L.138 13.499a.98.98 0 0 0 0 1.001c.193.31.53.501.886.501h13.964c.367 0 .704-.19.877-.5a1.03 1.03 0 0 0 .01-1.002L8.893 1.5zm.133 11.497H6.987v-2.003h2.039v2.003zm0-3.004H6.987V5.987h2.039v4.006z"}))),"caution")),(0,o.kt)("div",{parentName:"div",className:"admonition-content"},(0,o.kt)("p",{parentName:"div"},"\u8fd9\u79cd\u901a\u8fc7SpringMVC\u53d1\u5e03API\u7684\u6a21\u5f0f\u5e76\u975e\u76d8\u53e4\u5f00\u53d1\u7684\u6807\u51c6\u59ff\u52bf\uff0c\u53ea\u662f\u63d0\u4f9b\u8fd9\u4e48\u4e00\u79cd\u5f00\u53d1\u6a21\u5f0f\u9009\u9879\u3002"))),(0,o.kt)("h2",{id:"\u542f\u52a8\u5165\u53e3"},"\u542f\u52a8\u5165\u53e3"),(0,o.kt)("pre",null,(0,o.kt)("code",{parentName:"pre",className:"language-jsx",metastring:"{1,5}","{1,5}":!0},"@EnableDubbo\n@SpringBootApplication\npublic class DubboProviderApplication {\n    public static void main(String[] args) {\n        PanGuApplicationBuilder.init(DubboProviderApplication.class).run(args);\n    }\n}\n")),(0,o.kt)("h2",{id:"\u5b8c\u6574\u8bf7\u6c42url\u53ca\u53c2\u6570\u8bf4\u660e"},"\u5b8c\u6574\u8bf7\u6c42URL\u53ca\u53c2\u6570\u8bf4\u660e"),(0,o.kt)("p",null,"\u81f3\u6b64\uff0c\u5c31\u53ef\u4ee5\u901a\u8fc7http\u7684\u65b9\u5f0f\u6765\u8bf7\u6c42\u6211\u4eec\u7684\u7684dubbo\u670d\u52a1\u4e86\u3002\u6b64\u79cd\u5f00\u53d1\u6a21\u5f0f\u5b8c\u5168\u57fa\u4e8eSpringMVC\uff0c\u5176\u8bf7\u6c42\u5730\u5740\u548c\u53c2\u6570\u8bf4\u660e\u7b49\u4fe1\u606f\u672c\u6559\u7a0b\u4e0d\u518d\u5c55\u5f00\u53d9\u8ff0\u3002\u5982\u6709\u9700\u8981\uff0c\u8bf7\u81ea\u884c\u67e5\u9605SpringMVC\u8bf7\u6c42\u548c\u54cd\u5e94\u7684\u76f8\u5173\u6559\u7a0b\u5373\u53ef\u3002"),(0,o.kt)("h2",{id:"\u76f8\u5173\u53c2\u8003\u8303\u4f8b"},"\u76f8\u5173\u53c2\u8003\u8303\u4f8b"),(0,o.kt)("ul",null,(0,o.kt)("li",{parentName:"ul"},(0,o.kt)("a",{parentName:"li",href:"https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-dubbo-api"},"pangu-examples-dubbo-api"),"\uff1a\u670d\u52a1\u63a5\u53e3\u5305"),(0,o.kt)("li",{parentName:"ul"},(0,o.kt)("a",{parentName:"li",href:"https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-dubbo-service"},"pangu-examples-dubbo-service"),"\uff1a\u670d\u52a1\u63d0\u4f9b\u8005"),(0,o.kt)("li",{parentName:"ul"},(0,o.kt)("a",{parentName:"li",href:"https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-dubbo-gateway-service"},"pangu-examples-dubbo-gateway-service"),"\uff1a\u57fa\u4e8eSpringMVC\u7684\u7f51\u5173\u6a21\u5757\uff08\u670d\u52a1\u6d88\u8d39\u8005\uff09")),(0,o.kt)("h2",{id:"\u4e0b\u4e00\u6b65"},"\u4e0b\u4e00\u6b65"),(0,o.kt)("p",null,"\u7ee7\u7eed\u9605\u8bfb\u5176\u5b83\u7ae0\u8282\u83b7\u53d6\u60a8\u60f3\u8981\u7684\u7b54\u6848\u6216\u901a\u8fc7\u6211\u4eec\u7684",(0,o.kt)("a",{parentName:"p",href:"/docs/community"},"\u5f00\u53d1\u8005\u793e\u533a"),"\u5bfb\u6c42\u66f4\u591a\u5e2e\u52a9\u3002"))}g.isMDXComponent=!0}}]);