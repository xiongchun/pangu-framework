"use strict";(self.webpackChunkpangu_website=self.webpackChunkpangu_website||[]).push([[4518],{3905:(e,t,a)=>{a.d(t,{Zo:()=>s,kt:()=>g});var n=a(7294);function r(e,t,a){return t in e?Object.defineProperty(e,t,{value:a,enumerable:!0,configurable:!0,writable:!0}):e[t]=a,e}function l(e,t){var a=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),a.push.apply(a,n)}return a}function i(e){for(var t=1;t<arguments.length;t++){var a=null!=arguments[t]?arguments[t]:{};t%2?l(Object(a),!0).forEach((function(t){r(e,t,a[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(a)):l(Object(a)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(a,t))}))}return e}function p(e,t){if(null==e)return{};var a,n,r=function(e,t){if(null==e)return{};var a,n,r={},l=Object.keys(e);for(n=0;n<l.length;n++)a=l[n],t.indexOf(a)>=0||(r[a]=e[a]);return r}(e,t);if(Object.getOwnPropertySymbols){var l=Object.getOwnPropertySymbols(e);for(n=0;n<l.length;n++)a=l[n],t.indexOf(a)>=0||Object.prototype.propertyIsEnumerable.call(e,a)&&(r[a]=e[a])}return r}var o=n.createContext({}),u=function(e){var t=n.useContext(o),a=t;return e&&(a="function"==typeof e?e(t):i(i({},t),e)),a},s=function(e){var t=u(e.components);return n.createElement(o.Provider,{value:t},e.children)},m="mdxType",d={inlineCode:"code",wrapper:function(e){var t=e.children;return n.createElement(n.Fragment,{},t)}},c=n.forwardRef((function(e,t){var a=e.components,r=e.mdxType,l=e.originalType,o=e.parentName,s=p(e,["components","mdxType","originalType","parentName"]),m=u(a),c=r,g=m["".concat(o,".").concat(c)]||m[c]||d[c]||l;return a?n.createElement(g,i(i({ref:t},s),{},{components:a})):n.createElement(g,i({ref:t},s))}));function g(e,t){var a=arguments,r=t&&t.mdxType;if("string"==typeof e||r){var l=a.length,i=new Array(l);i[0]=c;var p={};for(var o in t)hasOwnProperty.call(t,o)&&(p[o]=t[o]);p.originalType=e,p[m]="string"==typeof e?e:r,i[1]=p;for(var u=2;u<l;u++)i[u]=a[u];return n.createElement.apply(null,i)}return n.createElement.apply(null,a)}c.displayName="MDXCreateElement"},699:(e,t,a)=>{a.r(t),a.d(t,{assets:()=>o,contentTitle:()=>i,default:()=>m,frontMatter:()=>l,metadata:()=>p,toc:()=>u});var n=a(7462),r=(a(7294),a(3905));const l={title:"\u4ee3\u7801\u751f\u6210\u5668\u63d2\u4ef6",tags:["\u4ee3\u7801\u751f\u6210\u5668\u63d2\u4ef6","\u6570\u636e\u6301\u4e45\u5316","MyBatis","MyBatis-Plus","\u76d8\u53e4\u7b80\u4ecb","\u76d8\u53e4\u67b6\u6784"],sidebar_position:30,slug:"/code-generator"},i=void 0,p={unversionedId:"advanced-guide/\u4ee3\u7801\u751f\u6210\u5668\u63d2\u4ef6",id:"advanced-guide/\u4ee3\u7801\u751f\u6210\u5668\u63d2\u4ef6",title:"\u4ee3\u7801\u751f\u6210\u5668\u63d2\u4ef6",description:"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6 | \u4ee3\u7801\u751f\u6210\u5668\u63d2\u4ef6",source:"@site/docs/advanced-guide/\u4ee3\u7801\u751f\u6210\u5668\u63d2\u4ef6.md",sourceDirName:"advanced-guide",slug:"/code-generator",permalink:"/pangu-framework/docs/code-generator",draft:!1,editUrl:"https://gitee.com/pulanos/pangu-framework/tree/master/pangu-website/docs/advanced-guide/\u4ee3\u7801\u751f\u6210\u5668\u63d2\u4ef6.md",tags:[{label:"\u4ee3\u7801\u751f\u6210\u5668\u63d2\u4ef6",permalink:"/pangu-framework/docs/tags/\u4ee3\u7801\u751f\u6210\u5668\u63d2\u4ef6"},{label:"\u6570\u636e\u6301\u4e45\u5316",permalink:"/pangu-framework/docs/tags/\u6570\u636e\u6301\u4e45\u5316"},{label:"MyBatis",permalink:"/pangu-framework/docs/tags/my-batis"},{label:"MyBatis-Plus",permalink:"/pangu-framework/docs/tags/my-batis-plus"},{label:"\u76d8\u53e4\u7b80\u4ecb",permalink:"/pangu-framework/docs/tags/\u76d8\u53e4\u7b80\u4ecb"},{label:"\u76d8\u53e4\u67b6\u6784",permalink:"/pangu-framework/docs/tags/\u76d8\u53e4\u67b6\u6784"}],version:"current",lastUpdatedBy:"xiongchun",sidebarPosition:30,frontMatter:{title:"\u4ee3\u7801\u751f\u6210\u5668\u63d2\u4ef6",tags:["\u4ee3\u7801\u751f\u6210\u5668\u63d2\u4ef6","\u6570\u636e\u6301\u4e45\u5316","MyBatis","MyBatis-Plus","\u76d8\u53e4\u7b80\u4ecb","\u76d8\u53e4\u67b6\u6784"],sidebar_position:30,slug:"/code-generator"},sidebar:"tutorialSidebar",previous:{title:"\u6570\u636e\u6cbb\u7406\u4e4b\u6570\u636e\u5206\u7247",permalink:"/pangu-framework/docs/advanced-guide/data-sharding"},next:{title:"\u8303\u4f8b\u6a21\u7248\u5de5\u7a0b",permalink:"/pangu-framework/docs/examples-list"}},o={},u=[{value:"\u5b89\u88c5 Maven \u63d2\u4ef6",id:"\u5b89\u88c5-maven-\u63d2\u4ef6",level:2},{value:"\u63d2\u4ef6\u53c2\u6570\u8bf4\u660e",id:"\u63d2\u4ef6\u53c2\u6570\u8bf4\u660e",level:3},{value:"\u8fd0\u884cMaven\u63d2\u4ef6",id:"\u8fd0\u884cmaven\u63d2\u4ef6",level:2},{value:"\u65b9\u5f0f\u4e00",id:"\u65b9\u5f0f\u4e00",level:3},{value:"\u65b9\u5f0f\u4e8c",id:"\u65b9\u5f0f\u4e8c",level:3},{value:"\u8f93\u51fa\u7ed3\u679c",id:"\u8f93\u51fa\u7ed3\u679c",level:3},{value:"\u672c\u6587\u76f8\u5173\u8303\u4f8b\u6e90\u7801",id:"\u672c\u6587\u76f8\u5173\u8303\u4f8b\u6e90\u7801",level:2},{value:"\u4e0b\u4e00\u6b65",id:"\u4e0b\u4e00\u6b65",level:2}],s={toc:u};function m(e){let{components:t,...l}=e;return(0,r.kt)("wrapper",(0,n.Z)({},s,l,{components:t,mdxType:"MDXLayout"}),(0,r.kt)("head",null,(0,r.kt)("title",null,"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6 | \u4ee3\u7801\u751f\u6210\u5668\u63d2\u4ef6"),(0,r.kt)("meta",{name:"keywords",content:"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6 | \u4ee3\u7801\u751f\u6210\u5668\u63d2\u4ef6"})),(0,r.kt)("p",null,"\u76d8\u53e4\u4ee3\u7801\u751f\u6210\u5668\u662f\u57fa\u4e8e Maven \u7684\u4e00\u4e2a\u81ea\u5b9a\u4e49\u63d2\u4ef6\u3002\u53ef\u4ee5\u65b9\u4fbf\u5feb\u6377\u7684\u4ee5\u63d2\u4ef6\u7684\u65b9\u5f0f\u5b89\u88c5\u5230\u4efb\u4f55\u4e00\u4e2a Maven \u6a21\u5757\u4e2d\u53bb\u3002\u76ee\u524d\u652f\u6301\u751f\u6210\u5982\u4e0b\u4ee3\u7801\u3002"),(0,r.kt)("ul",null,(0,r.kt)("li",{parentName:"ul"},"MyBatis Plus Mapper.java \u6620\u5c04\u63a5\u53e3\u6587\u4ef6"),(0,r.kt)("li",{parentName:"ul"},"MyBatis Plus Entity.java \u5b9e\u4f53\u6587\u4ef6")),(0,r.kt)("admonition",{title:"\u5efa\u8bae",type:"caution"},(0,r.kt)("p",{parentName:"admonition"},"\u6839\u636e\u5b9e\u8df5\u7ecf\u9a8c\uff0c\u4e0d\u5efa\u8bae\u4f7f\u7528 MyBatis Plus \u7684\u751f\u6210\u5668\uff0c\u66f4\u4e0d\u5efa\u8bae\u751f\u6210 Mybatis Plus \u98ce\u683c\u7684 Service \u6587\u4ef6\u3002")),(0,r.kt)("h2",{id:"\u5b89\u88c5-maven-\u63d2\u4ef6"},"\u5b89\u88c5 Maven \u63d2\u4ef6"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx",metastring:'title="pom.xml"',title:'"pom.xml"'},"<plugin>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-framework-generator-maven-plugin</artifactId>\n    <version>5.0.6</version>\n    <configuration>\n        <url>jdbc:mysql://127.0.0.1:3306/pangu-showcases</url>\n        <user>root</user>\n        <password>root123456</password>\n        <tables>user,resource</tables>\n        <author>xiongchun</author>\n        <entityFilePath>${project.basedir}/src/main/java/com/gitee/pulanos/pangu/showcases/crud/dao/entity</entityFilePath>\n        <mapperFilePath>${project.basedir}/src/main/java/com/gitee/pulanos/pangu/showcases/crud/dao/mapper</mapperFilePath>\n    </configuration>\n</plugin>\n")),(0,r.kt)("h3",{id:"\u63d2\u4ef6\u53c2\u6570\u8bf4\u660e"},"\u63d2\u4ef6\u53c2\u6570\u8bf4\u660e"),(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},(0,r.kt)("div",{style:{width:"120px"}},"\u914d\u7f6e\u9879")),(0,r.kt)("th",{parentName:"tr",align:null},"\u914d\u7f6e\u8bf4\u660e"))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"url"),(0,r.kt)("td",{parentName:"tr",align:null},"\u6570\u636e\u5e93\u8fde\u63a5\u5730\u5740")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"user"),(0,r.kt)("td",{parentName:"tr",align:null},"\u6570\u636e\u5e93\u7528\u6237\u540d")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"password"),(0,r.kt)("td",{parentName:"tr",align:null},"\u6570\u636e\u5e93\u5bc6\u7801")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"tables"),(0,r.kt)("td",{parentName:"tr",align:null},"\u76ee\u6807\u6570\u636e\u5e93\u8868\uff0c\u591a\u4e2a\u8868\u7528\u9017\u53f7\u5206\u5272")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"author"),(0,r.kt)("td",{parentName:"tr",align:null},"\u6e90\u4ee3\u7801\u6587\u4ef6\u7684\u4f5c\u8005\u7b7e\u540d")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"entityFilePath"),(0,r.kt)("td",{parentName:"tr",align:null},"\u5b9e\u4f53\u7c7b\u6587\u4ef6\u8f93\u51fa\u8def\u5f84\uff08\u6839\u636e\u6b64\u8def\u5f84\u63a8\u5bfc\u5305\u7ed3\u6784\uff09")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},"mapperFilePath"),(0,r.kt)("td",{parentName:"tr",align:null},"Mapper \u7c7b\u6587\u4ef6\u8f93\u51fa\u8def\u5f84\uff08\u6839\u636e\u6b64\u8def\u5f84\u63a8\u5bfc\u5305\u7ed3\u6784\uff09")))),(0,r.kt)("admonition",{title:"\u63d0\u793a",type:"tip"},(0,r.kt)("ul",{parentName:"admonition"},(0,r.kt)("li",{parentName:"ul"},"\u4e0a\u8868\u4e2d\u8f93\u51fa\u8def\u5f84\u53c2\u6570\u53ef\u4ee5\u662f\u57fa\u4e8e ${project.basedir} \u7684\u76f8\u5bf9\u8def\u5f84\uff0c\u4e5f\u53ef\u4ee5\u662f\u7edd\u5bf9\u8def\u5f84\u3002"),(0,r.kt)("li",{parentName:"ul"},"\u5fae\u670d\u52a1\u5f00\u53d1\u4e2d\u5b9e\u4f53\u7c7b\u6587\u4ef6\u4e00\u822c\u662f\u751f\u6210\u5230\u670d\u52a1\u63a5\u53e3\u5305\u91cc\uff0c\u4e0e\u670d\u52a1\u6d88\u8d39\u65b9\u5171\u4eab\u3002\uff08\u53ef\u4ee5\u5728\u63a5\u53e3\u5305\u6a21\u5757\u5b89\u88c5\u6b64\u63d2\u4ef6\uff0c\u6216\u8005\u5728\u670d\u52a1\u5b9e\u73b0\u6a21\u5757\u5c06\u5b9e\u4f53\u7c7b\u751f\u6210\u8def\u5f84\u76f4\u63a5\u6307\u5411\u63a5\u53e3\u5305\uff09"))),(0,r.kt)("h2",{id:"\u8fd0\u884cmaven\u63d2\u4ef6"},"\u8fd0\u884cMaven\u63d2\u4ef6"),(0,r.kt)("h3",{id:"\u65b9\u5f0f\u4e00"},"\u65b9\u5f0f\u4e00"),(0,r.kt)("p",null,"\u901a\u8fc7 IDEA \u6216 Eclipse \u7b49\u5f00\u53d1\u5de5\u5177\u6765\u6267\u884c\u540d\u4e3a ",(0,r.kt)("inlineCode",{parentName:"p"},"pangu")," \u7684 Maven \u63d2\u4ef6\u3002\u5982\u4e0b\u56fe\u6240\u793a\u3002"),(0,r.kt)("img",{width:"500",src:a(6597).Z,alt:"\u76d8\u53e4\u4ee3\u7801\u751f\u6210\u5668"}),(0,r.kt)("h3",{id:"\u65b9\u5f0f\u4e8c"},"\u65b9\u5f0f\u4e8c"),(0,r.kt)("p",null,"\u901a\u8fc7 Mavne \u811a\u672c\u6267\u884c\u3002\u5982\u4e0b\u6240\u793a\u3002"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx",metastring:'title="\u547d\u4ee4\u884c\u811a\u672c"',title:'"\u547d\u4ee4\u884c\u811a\u672c"'},"cd pom.xml\u6240\u5728\u7684\u66f4\u76ee\u5f55\nmvn pangu:generate\n")),(0,r.kt)("h3",{id:"\u8f93\u51fa\u7ed3\u679c"},"\u8f93\u51fa\u7ed3\u679c"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx",metastring:'title="\u63a7\u5236\u53f0\u8f93\u51fa\u65e5\u5fd7"',title:'"\u63a7\u5236\u53f0\u8f93\u51fa\u65e5\u5fd7"'},"xc@xc-mac pangu-examples-crud % mvn pangu:generate\n[INFO] Scanning for projects...\n[INFO] \n[INFO] ------------< com.gitee.pulanos.pangu:pangu-examples-crud >-------------\n[INFO] Building pangu-examples-crud 1.0.0\n[INFO] --------------------------------[ jar ]---------------------------------\n[INFO] \n[INFO] --- pangu-framework-generator-maven-plugin:5.0.6:generate (default-cli) @ pangu-examples-crud ---\n[INFO] \u5f00\u59cb\u751f\u6210\u6570\u636e\u8868[user]\u5bf9\u5e94\u7684\u5b9e\u4f53\u5bf9\u8c61...\n[INFO] UserEntity.java \u751f\u6210\u6210\u529f\u3002\u6587\u4ef6\u8def\u5f84\uff1a/Users/xc/git2/pangu-framework/pangu-examples/pangu-examples-crud/src/main/java/com/gitee/pulanos/pangu/showcases/crud/dao/entiity.java\n[INFO] \u5f00\u59cb\u751f\u6210\u6570\u636e\u8868[user]\u5bf9\u5e94\u7684\u6570\u636e\u8bbf\u95ee\u63a5\u53e3...\n[INFO] UserMapper.java \u751f\u6210\u6210\u529f\u3002\u6587\u4ef6\u8def\u5f84\uff1a/Users/xc/git2/pangu-framework/pangu-examples/pangu-examples-crud/src/main/java/com/gitee/pulanos/pangu/showcases/crud/dao/mapper/UserMapper.java\n[INFO] ------------------------------------------------------------------------\n[INFO] BUILD SUCCESS\n[INFO] ------------------------------------------------------------------------\n[INFO] Total time:  1.291 s\n[INFO] Finished at: 2021-11-15T21:54:22+08:00\n[INFO] ------------------------------------------------------------------------\n")),(0,r.kt)("h2",{id:"\u672c\u6587\u76f8\u5173\u8303\u4f8b\u6e90\u7801"},"\u672c\u6587\u76f8\u5173\u8303\u4f8b\u6e90\u7801"),(0,r.kt)("ul",null,(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("a",{parentName:"li",href:"https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-crud"},"pangu-examples-crud"),"\uff1a\u6570\u636e\u6301\u4e45\u5316\u53c2\u8003\u8303\u4f8b\uff08\u542b\u4ee3\u7801\u751f\u6210\u5668\u6f14\u793a\uff09"),(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("a",{parentName:"li",href:"https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-dubbo-api"},"pangu-examples-dubbo-api"),"\uff1a\u670d\u52a1\u63a5\u53e3\u5305\uff08\u542b\u4ee3\u7801\u751f\u6210\u5668\u6f14\u793a\uff09")),(0,r.kt)("h2",{id:"\u4e0b\u4e00\u6b65"},"\u4e0b\u4e00\u6b65"),(0,r.kt)("p",null,"\u7ee7\u7eed\u9605\u8bfb\u5176\u5b83\u7ae0\u8282\u83b7\u53d6\u4f60\u60f3\u8981\u7684\u7b54\u6848\u6216\u901a\u8fc7\u6211\u4eec\u7684 ",(0,r.kt)("a",{parentName:"p",href:"/community"},"\u5f00\u53d1\u8005\u793e\u533a")," \u5bfb\u6c42\u66f4\u591a\u5e2e\u52a9\u3002"))}m.isMDXComponent=!0},6597:(e,t,a)=>{a.d(t,{Z:()=>n});const n=a.p+"assets/images/13-pangu-framework-generator-1b1785f2701023393ecf019f5eb02f1e.png"}}]);