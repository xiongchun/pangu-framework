"use strict";(self.webpackChunkpangu_website=self.webpackChunkpangu_website||[]).push([[111],{3905:(e,a,t)=>{t.d(a,{Zo:()=>d,kt:()=>g});var n=t(7294);function r(e,a,t){return a in e?Object.defineProperty(e,a,{value:t,enumerable:!0,configurable:!0,writable:!0}):e[a]=t,e}function l(e,a){var t=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);a&&(n=n.filter((function(a){return Object.getOwnPropertyDescriptor(e,a).enumerable}))),t.push.apply(t,n)}return t}function p(e){for(var a=1;a<arguments.length;a++){var t=null!=arguments[a]?arguments[a]:{};a%2?l(Object(t),!0).forEach((function(a){r(e,a,t[a])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(t)):l(Object(t)).forEach((function(a){Object.defineProperty(e,a,Object.getOwnPropertyDescriptor(t,a))}))}return e}function o(e,a){if(null==e)return{};var t,n,r=function(e,a){if(null==e)return{};var t,n,r={},l=Object.keys(e);for(n=0;n<l.length;n++)t=l[n],a.indexOf(t)>=0||(r[t]=e[t]);return r}(e,a);if(Object.getOwnPropertySymbols){var l=Object.getOwnPropertySymbols(e);for(n=0;n<l.length;n++)t=l[n],a.indexOf(t)>=0||Object.prototype.propertyIsEnumerable.call(e,t)&&(r[t]=e[t])}return r}var u=n.createContext({}),s=function(e){var a=n.useContext(u),t=a;return e&&(t="function"==typeof e?e(a):p(p({},a),e)),t},d=function(e){var a=s(e.components);return n.createElement(u.Provider,{value:a},e.children)},i="mdxType",c={inlineCode:"code",wrapper:function(e){var a=e.children;return n.createElement(n.Fragment,{},a)}},m=n.forwardRef((function(e,a){var t=e.components,r=e.mdxType,l=e.originalType,u=e.parentName,d=o(e,["components","mdxType","originalType","parentName"]),i=s(t),m=r,g=i["".concat(u,".").concat(m)]||i[m]||c[m]||l;return t?n.createElement(g,p(p({ref:a},d),{},{components:t})):n.createElement(g,p({ref:a},d))}));function g(e,a){var t=arguments,r=a&&a.mdxType;if("string"==typeof e||r){var l=t.length,p=new Array(l);p[0]=m;var o={};for(var u in a)hasOwnProperty.call(a,u)&&(o[u]=a[u]);o.originalType=e,o[i]="string"==typeof e?e:r,p[1]=o;for(var s=2;s<l;s++)p[s]=t[s];return n.createElement.apply(null,p)}return n.createElement.apply(null,t)}m.displayName="MDXCreateElement"},5162:(e,a,t)=>{t.d(a,{Z:()=>p});var n=t(7294),r=t(6010);const l="tabItem_Ymn6";function p(e){let{children:a,hidden:t,className:p}=e;return n.createElement("div",{role:"tabpanel",className:(0,r.Z)(l,p),hidden:t},a)}},5488:(e,a,t)=>{t.d(a,{Z:()=>m});var n=t(7462),r=t(7294),l=t(6010),p=t(2389),o=t(7392),u=t(7094),s=t(2466);const d="tabList__CuJ",i="tabItem_LNqP";function c(e){const{lazy:a,block:t,defaultValue:p,values:c,groupId:m,className:g}=e,b=r.Children.map(e.children,(e=>{if((0,r.isValidElement)(e)&&"value"in e.props)return e;throw new Error(`Docusaurus error: Bad <Tabs> child <${"string"==typeof e.type?e.type:e.type.name}>: all children of the <Tabs> component should be <TabItem>, and every <TabItem> should have a unique "value" prop.`)})),v=c??b.map((e=>{let{props:{value:a,label:t,attributes:n}}=e;return{value:a,label:t,attributes:n}})),k=(0,o.l)(v,((e,a)=>e.value===a.value));if(k.length>0)throw new Error(`Docusaurus error: Duplicate values "${k.map((e=>e.value)).join(", ")}" found in <Tabs>. Every value needs to be unique.`);const y=null===p?p:p??b.find((e=>e.props.default))?.props.value??b[0].props.value;if(null!==y&&!v.some((e=>e.value===y)))throw new Error(`Docusaurus error: The <Tabs> has a defaultValue "${y}" but none of its children has the corresponding value. Available values are: ${v.map((e=>e.value)).join(", ")}. If you intend to show no default tab, use defaultValue={null} instead.`);const{tabGroupChoices:f,setTabGroupChoices:T}=(0,u.U)(),[I,x]=(0,r.useState)(y),h=[],{blockElementScrollPositionUntilNextRender:N}=(0,s.o5)();if(null!=m){const e=f[m];null!=e&&e!==I&&v.some((a=>a.value===e))&&x(e)}const j=e=>{const a=e.currentTarget,t=h.indexOf(a),n=v[t].value;n!==I&&(N(a),x(n),null!=m&&T(m,String(n)))},Z=e=>{let a=null;switch(e.key){case"Enter":j(e);break;case"ArrowRight":{const t=h.indexOf(e.currentTarget)+1;a=h[t]??h[0];break}case"ArrowLeft":{const t=h.indexOf(e.currentTarget)-1;a=h[t]??h[h.length-1];break}}a?.focus()};return r.createElement("div",{className:(0,l.Z)("tabs-container",d)},r.createElement("ul",{role:"tablist","aria-orientation":"horizontal",className:(0,l.Z)("tabs",{"tabs--block":t},g)},v.map((e=>{let{value:a,label:t,attributes:p}=e;return r.createElement("li",(0,n.Z)({role:"tab",tabIndex:I===a?0:-1,"aria-selected":I===a,key:a,ref:e=>h.push(e),onKeyDown:Z,onClick:j},p,{className:(0,l.Z)("tabs__item",i,p?.className,{"tabs__item--active":I===a})}),t??a)}))),a?(0,r.cloneElement)(b.filter((e=>e.props.value===I))[0],{className:"margin-top--md"}):r.createElement("div",{className:"margin-top--md"},b.map(((e,a)=>(0,r.cloneElement)(e,{key:a,hidden:e.props.value!==I})))))}function m(e){const a=(0,p.Z)();return r.createElement(c,(0,n.Z)({key:String(a)},e))}},6518:(e,a,t)=>{t.r(a),t.d(a,{assets:()=>d,contentTitle:()=>u,default:()=>m,frontMatter:()=>o,metadata:()=>s,toc:()=>i});var n=t(7462),r=(t(7294),t(3905)),l=t(5488),p=t(5162);const o={title:"\u5b89\u88c5",tags:["\u76d8\u53e4\u7b80\u4ecb","\u76d8\u53e4\u67b6\u6784"],sidebar_position:2,slug:"/install"},u=void 0,s={unversionedId:"\u5b89\u88c5",id:"\u5b89\u88c5",title:"\u5b89\u88c5",description:"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6 | \u5b89\u88c5 | \u4f9d\u8d56\u7ba1\u7406\u6a21\u5757 | \u57fa\u7840\u6a21\u5757 | Dubbo\u6a21\u5757 | JDBC\u6a21\u5757 | \u5206\u5e03\u5f0f\u4e8b\u52a1\u7ba1\u7406\u6a21\u5757 | \u6570\u636e\u6cbb\u7406\u6a21\u5757 | \u7f13\u5b58\u6a21\u5757 | \u6d88\u606f\u961f\u5217\u6a21\u5757 | \u7f51\u5173\u6a21\u5757 | Web\u6a21\u5757 | \u4ee3\u7801\u751f\u6210\u63d2\u4ef6",source:"@site/docs/\u5b89\u88c5.md",sourceDirName:".",slug:"/install",permalink:"/docs/install",draft:!1,editUrl:"https://gitee.com/pulanos/pangu-framework/tree/master/pangu-website/docs/\u5b89\u88c5.md",tags:[{label:"\u76d8\u53e4\u7b80\u4ecb",permalink:"/docs/tags/\u76d8\u53e4\u7b80\u4ecb"},{label:"\u76d8\u53e4\u67b6\u6784",permalink:"/docs/tags/\u76d8\u53e4\u67b6\u6784"}],version:"current",lastUpdatedBy:"xiongchun",lastUpdatedAt:1678370102,formattedLastUpdatedAt:"2023\u5e743\u67089\u65e5",sidebarPosition:2,frontMatter:{title:"\u5b89\u88c5",tags:["\u76d8\u53e4\u7b80\u4ecb","\u76d8\u53e4\u67b6\u6784"],sidebar_position:2,slug:"/install"},sidebar:"tutorialSidebar",previous:{title:"\u7b80\u4ecb",permalink:"/docs/intro"},next:{title:"\u5f00\u53d1\u67b6\u6784\u6a21\u5f0f\u5bf9\u6bd4",permalink:"/docs/quick-start/how-to-make-architecture"}},d={},i=[{value:"\u4f9d\u8d56\u7ba1\u7406\u6a21\u5757",id:"\u4f9d\u8d56\u7ba1\u7406\u6a21\u5757",level:2},{value:"\u57fa\u7840\u6a21\u5757",id:"\u57fa\u7840\u6a21\u5757",level:2},{value:"Dubbo\u6a21\u5757",id:"dubbo\u6a21\u5757",level:2},{value:"JDBC\u6a21\u5757",id:"jdbc\u6a21\u5757",level:2},{value:"\u5206\u5e03\u5f0f\u4e8b\u52a1\u7ba1\u7406\u6a21\u5757",id:"\u5206\u5e03\u5f0f\u4e8b\u52a1\u7ba1\u7406\u6a21\u5757",level:2},{value:"\u6570\u636e\u6cbb\u7406\u6a21\u5757",id:"\u6570\u636e\u6cbb\u7406\u6a21\u5757",level:2},{value:"\u7f13\u5b58\u6a21\u5757",id:"\u7f13\u5b58\u6a21\u5757",level:2},{value:"\u6d88\u606f\u961f\u5217\u6a21\u5757",id:"\u6d88\u606f\u961f\u5217\u6a21\u5757",level:2},{value:"Web\u6a21\u5757",id:"web\u6a21\u5757",level:2},{value:"\u4ee3\u7801\u751f\u6210\u63d2\u4ef6",id:"\u4ee3\u7801\u751f\u6210\u63d2\u4ef6",level:2},{value:"\u4e0b\u4e00\u6b65",id:"\u4e0b\u4e00\u6b65",level:2}],c={toc:i};function m(e){let{components:a,...t}=e;return(0,r.kt)("wrapper",(0,n.Z)({},c,t,{components:a,mdxType:"MDXLayout"}),(0,r.kt)("head",null,(0,r.kt)("title",null,"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6 | \u5b89\u88c5 | \u4f9d\u8d56\u7ba1\u7406\u6a21\u5757 | \u57fa\u7840\u6a21\u5757 | Dubbo\u6a21\u5757 | JDBC\u6a21\u5757 | \u5206\u5e03\u5f0f\u4e8b\u52a1\u7ba1\u7406\u6a21\u5757 | \u6570\u636e\u6cbb\u7406\u6a21\u5757 | \u7f13\u5b58\u6a21\u5757 | \u6d88\u606f\u961f\u5217\u6a21\u5757 | \u7f51\u5173\u6a21\u5757 | Web\u6a21\u5757 | \u4ee3\u7801\u751f\u6210\u63d2\u4ef6"),(0,r.kt)("meta",{name:"keywords",content:"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6 | \u5b89\u88c5 | \u4f9d\u8d56\u7ba1\u7406\u6a21\u5757 | \u57fa\u7840\u6a21\u5757 | Dubbo\u6a21\u5757 | JDBC\u6a21\u5757 | \u5206\u5e03\u5f0f\u4e8b\u52a1\u7ba1\u7406\u6a21\u5757 | \u6570\u636e\u6cbb\u7406\u6a21\u5757 | \u7f13\u5b58\u6a21\u5757 | \u6d88\u606f\u961f\u5217\u6a21\u5757 | \u7f51\u5173\u6a21\u5757 | Web\u6a21\u5757 | \u4ee3\u7801\u751f\u6210\u63d2\u4ef6"})),(0,r.kt)("p",null,"\u76d8\u53e4\u670d\u52a1\u5f00\u53d1\u6846\u67b6\u5df2\u7ecf\u53d1\u5e03\u5230 Maven \u4e2d\u592e\u4ed3\u5e93\uff0c\u76f4\u63a5\u4f7f\u7528\u5982\u4e0b\u65b9\u6cd5\u5b89\u88c5\u4f7f\u7528\u5373\u53ef\u3002"),(0,r.kt)("h2",{id:"\u4f9d\u8d56\u7ba1\u7406\u6a21\u5757"},"\u4f9d\u8d56\u7ba1\u7406\u6a21\u5757"),(0,r.kt)("p",null,"\u76d8\u53e4\u8d44\u6e90\u4f9d\u8d56\u58f0\u660e\u7ba1\u7406\u6a21\u5757\u3002\u6240\u6709\u76d8\u53e4\u5f15\u7528\u90fd\u5e94\u8be5\u4f9d\u8d56\u8fd9\u4e2a\u6a21\u5757\u3002"),(0,r.kt)(l.Z,{mdxType:"Tabs"},(0,r.kt)(p.Z,{value:"maven",label:"Maven\u5750\u6807",mdxType:"TabItem"},(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},"<parent>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-parent</artifactId>\n    <version>${\u6700\u65b0\u7a33\u5b9a\u7248\u672c}</version>\n    <relativePath/>\n</parent>\n"))),(0,r.kt)(p.Z,{value:"Gradle",label:"Gradle DSL",mdxType:"TabItem"},(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},"implementation 'com.gitee.pulanos.pangu:pangu-parent:${\u6700\u65b0\u7a33\u5b9a\u7248\u672c}'\n")))),(0,r.kt)("h2",{id:"\u57fa\u7840\u6a21\u5757"},"\u57fa\u7840\u6a21\u5757"),(0,r.kt)("p",null,"\u76d8\u53e4\u542f\u52a8\u3001\u4e2d\u5fc3\u5316\u914d\u7f6e\u3001\u52a8\u6001\u65e5\u5fd7\u7b49\u57fa\u7840\u80fd\u529b\u81ea\u52a8\u88c5\u914d\u6a21\u5757\u3002"),(0,r.kt)(l.Z,{mdxType:"Tabs"},(0,r.kt)(p.Z,{value:"maven",label:"Maven\u5750\u6807",mdxType:"TabItem"},(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-spring-boot-starter</artifactId>\n</dependency>\n"))),(0,r.kt)(p.Z,{value:"Gradle",label:"Gradle DSL",mdxType:"TabItem"},(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},"implementation 'com.gitee.pulanos.pangu:pangu-spring-boot-starter:${\u6700\u65b0\u7a33\u5b9a\u7248\u672c}'\n")))),(0,r.kt)("h2",{id:"dubbo\u6a21\u5757"},"Dubbo\u6a21\u5757"),(0,r.kt)("p",null,"\u76d8\u53e4\u5fae\u670d\u52a1\u5f00\u53d1\u81ea\u52a8\u88c5\u914d\u6a21\u5757\u3002"),(0,r.kt)(l.Z,{mdxType:"Tabs"},(0,r.kt)(p.Z,{value:"maven",label:"Maven\u5750\u6807",mdxType:"TabItem"},(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-dubbo-spring-boot-starter</artifactId>\n</dependency>\n"))),(0,r.kt)(p.Z,{value:"Gradle",label:"Gradle DSL",mdxType:"TabItem"},(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},"implementation 'com.gitee.pulanos.pangu:pangu-dubbo-spring-boot-starter:${\u6700\u65b0\u7a33\u5b9a\u7248\u672c}'\n")))),(0,r.kt)("h2",{id:"jdbc\u6a21\u5757"},"JDBC\u6a21\u5757"),(0,r.kt)("p",null,"\u76d8\u53e4\u6570\u636e\u5e93\u6301\u4e45\u5316\u64cd\u4f5c\u81ea\u52a8\u88c5\u914d\u6a21\u5757\u3002"),(0,r.kt)(l.Z,{mdxType:"Tabs"},(0,r.kt)(p.Z,{value:"maven",label:"Maven\u5750\u6807",mdxType:"TabItem"},(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-jdbc-spring-boot-starter</artifactId>\n</dependency>\n"))),(0,r.kt)(p.Z,{value:"Gradle",label:"Gradle DSL",mdxType:"TabItem"},(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},"implementation 'com.gitee.pulanos.pangu:pangu-jdbc-spring-boot-starter:${\u6700\u65b0\u7a33\u5b9a\u7248\u672c}'\n")))),(0,r.kt)("h2",{id:"\u5206\u5e03\u5f0f\u4e8b\u52a1\u7ba1\u7406\u6a21\u5757"},"\u5206\u5e03\u5f0f\u4e8b\u52a1\u7ba1\u7406\u6a21\u5757"),(0,r.kt)("p",null,"\u76d8\u53e4 Seata \u5206\u5e03\u5f0f\u4e8b\u52a1\u81ea\u52a8\u88c5\u914d\u6a21\u5757\u3002"),(0,r.kt)(l.Z,{mdxType:"Tabs"},(0,r.kt)(p.Z,{value:"maven",label:"Maven\u5750\u6807",mdxType:"TabItem"},(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-seata-spring-boot-starter</artifactId>\n</dependency>\n"))),(0,r.kt)(p.Z,{value:"Gradle",label:"Gradle DSL",mdxType:"TabItem"},(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},"implementation 'com.gitee.pulanos.pangu:pangu-seata-spring-boot-starter:${\u6700\u65b0\u7a33\u5b9a\u7248\u672c}'\n")))),(0,r.kt)("h2",{id:"\u6570\u636e\u6cbb\u7406\u6a21\u5757"},"\u6570\u636e\u6cbb\u7406\u6a21\u5757"),(0,r.kt)("p",null,"\u76d8\u53e4 ShardingSphere \u6570\u636e\u6cbb\u7406\uff08\u5982\uff1a\u8bfb\u5199\u5206\u79bb\u3001\u6570\u636e\u5206\u7247\u3001\u6570\u636e\u52a0\u5bc6\u7b49\uff09\u81ea\u52a8\u88c5\u914d\u6a21\u5757\u3002"),(0,r.kt)(l.Z,{mdxType:"Tabs"},(0,r.kt)(p.Z,{value:"maven",label:"Maven\u5750\u6807",mdxType:"TabItem"},(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-data-governance-spring-boot-starter</artifactId>\n</dependency>\n"))),(0,r.kt)(p.Z,{value:"Gradle",label:"Gradle DSL",mdxType:"TabItem"},(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},"implementation 'com.gitee.pulanos.pangu:pangu-data-governance-spring-boot-starter:${\u6700\u65b0\u7a33\u5b9a\u7248\u672c}'\n")))),(0,r.kt)("h2",{id:"\u7f13\u5b58\u6a21\u5757"},"\u7f13\u5b58\u6a21\u5757"),(0,r.kt)("p",null,"\u76d8\u53e4\u7f13\u5b58\u5f00\u53d1\u81ea\u52a8\u88c5\u914d\u6a21\u5757\u3002"),(0,r.kt)(l.Z,{mdxType:"Tabs"},(0,r.kt)(p.Z,{value:"maven",label:"Maven\u5750\u6807",mdxType:"TabItem"},(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-cache-spring-boot-starter</artifactId>\n</dependency>\n"))),(0,r.kt)(p.Z,{value:"Gradle",label:"Gradle DSL",mdxType:"TabItem"},(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},"implementation 'com.gitee.pulanos.pangu:pangu-cache-spring-boot-starter:${\u6700\u65b0\u7a33\u5b9a\u7248\u672c}'\n")))),(0,r.kt)("h2",{id:"\u6d88\u606f\u961f\u5217\u6a21\u5757"},"\u6d88\u606f\u961f\u5217\u6a21\u5757"),(0,r.kt)("p",null,"\u76d8\u53e4 RabbitMQ \u6d88\u606f\u961f\u5217\u5f00\u53d1\u81ea\u52a8\u88c5\u914d\u6a21\u5757\u3002"),(0,r.kt)(l.Z,{mdxType:"Tabs"},(0,r.kt)(p.Z,{value:"maven",label:"Maven\u5750\u6807",mdxType:"TabItem"},(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-rabbitmq-spring-boot-starter</artifactId>\n</dependency>\n"))),(0,r.kt)(p.Z,{value:"Gradle",label:"Gradle DSL",mdxType:"TabItem"},(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},"implementation 'com.gitee.pulanos.pangu:pangu-rabbitmq-spring-boot-starter:${\u6700\u65b0\u7a33\u5b9a\u7248\u672c}'\n")))),(0,r.kt)("h2",{id:"web\u6a21\u5757"},"Web\u6a21\u5757"),(0,r.kt)("p",null,"\u76d8\u53e4 Web \u5e94\u7528\u81ea\u52a8\u88c5\u914d\u6a21\u5757\u3002"),(0,r.kt)(l.Z,{mdxType:"Tabs"},(0,r.kt)(p.Z,{value:"maven",label:"Maven\u5750\u6807",mdxType:"TabItem"},(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-web-spring-boot-starter</artifactId>\n</dependency>\n"))),(0,r.kt)(p.Z,{value:"Gradle",label:"Gradle DSL",mdxType:"TabItem"},(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},"implementation 'com.gitee.pulanos.pangu:pangu-web-spring-boot-starter:${\u6700\u65b0\u7a33\u5b9a\u7248\u672c}'\n")))),(0,r.kt)("h2",{id:"\u4ee3\u7801\u751f\u6210\u63d2\u4ef6"},"\u4ee3\u7801\u751f\u6210\u63d2\u4ef6"),(0,r.kt)("p",null,"\u76d8\u53e4\u4ee3\u7801\u751f\u6210\u5668 Maven \u63d2\u4ef6\u3002"),(0,r.kt)(l.Z,{mdxType:"Tabs"},(0,r.kt)(p.Z,{value:"maven",label:"Maven\u5750\u6807",mdxType:"TabItem"},(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-generator-maven-plugin</artifactId>\n</dependency>\n"))),(0,r.kt)(p.Z,{value:"Gradle",label:"Gradle DSL",mdxType:"TabItem"},(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},"implementation 'com.gitee.pulanos.pangu:pangu-generator-maven-plugin:${\u6700\u65b0\u7a33\u5b9a\u7248\u672c}'\n")))),(0,r.kt)("h2",{id:"\u4e0b\u4e00\u6b65"},"\u4e0b\u4e00\u6b65"),(0,r.kt)("p",null,"\u7ee7\u7eed\u9605\u8bfb\u5176\u5b83\u7ae0\u8282\u83b7\u53d6\u4f60\u60f3\u8981\u7684\u7b54\u6848\u6216\u901a\u8fc7\u6211\u4eec\u7684 ",(0,r.kt)("a",{parentName:"p",href:"/community"},"\u5f00\u53d1\u8005\u793e\u533a")," \u5bfb\u6c42\u66f4\u591a\u5e2e\u52a9\u3002"))}m.isMDXComponent=!0}}]);