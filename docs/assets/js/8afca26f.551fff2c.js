"use strict";(self.webpackChunkpangu_website=self.webpackChunkpangu_website||[]).push([[5943],{3905:function(e,t,a){a.d(t,{Zo:function(){return o},kt:function(){return m}});var n=a(7294);function r(e,t,a){return t in e?Object.defineProperty(e,t,{value:a,enumerable:!0,configurable:!0,writable:!0}):e[t]=a,e}function l(e,t){var a=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),a.push.apply(a,n)}return a}function s(e){for(var t=1;t<arguments.length;t++){var a=null!=arguments[t]?arguments[t]:{};t%2?l(Object(a),!0).forEach((function(t){r(e,t,a[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(a)):l(Object(a)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(a,t))}))}return e}function i(e,t){if(null==e)return{};var a,n,r=function(e,t){if(null==e)return{};var a,n,r={},l=Object.keys(e);for(n=0;n<l.length;n++)a=l[n],t.indexOf(a)>=0||(r[a]=e[a]);return r}(e,t);if(Object.getOwnPropertySymbols){var l=Object.getOwnPropertySymbols(e);for(n=0;n<l.length;n++)a=l[n],t.indexOf(a)>=0||Object.prototype.propertyIsEnumerable.call(e,a)&&(r[a]=e[a])}return r}var p=n.createContext({}),u=function(e){var t=n.useContext(p),a=t;return e&&(a="function"==typeof e?e(t):s(s({},t),e)),a},o=function(e){var t=u(e.components);return n.createElement(p.Provider,{value:t},e.children)},c={inlineCode:"code",wrapper:function(e){var t=e.children;return n.createElement(n.Fragment,{},t)}},d=n.forwardRef((function(e,t){var a=e.components,r=e.mdxType,l=e.originalType,p=e.parentName,o=i(e,["components","mdxType","originalType","parentName"]),d=u(a),m=r,g=d["".concat(p,".").concat(m)]||d[m]||c[m]||l;return a?n.createElement(g,s(s({ref:t},o),{},{components:a})):n.createElement(g,s({ref:t},o))}));function m(e,t){var a=arguments,r=t&&t.mdxType;if("string"==typeof e||r){var l=a.length,s=new Array(l);s[0]=d;var i={};for(var p in t)hasOwnProperty.call(t,p)&&(i[p]=t[p]);i.originalType=e,i.mdxType="string"==typeof e?e:r,s[1]=i;for(var u=2;u<l;u++)s[u]=a[u];return n.createElement.apply(null,s)}return n.createElement.apply(null,a)}d.displayName="MDXCreateElement"},8215:function(e,t,a){var n=a(7294);t.Z=function(e){var t=e.children,a=e.hidden,r=e.className;return n.createElement("div",{role:"tabpanel",hidden:a,className:r},t)}},6396:function(e,t,a){a.d(t,{Z:function(){return d}});var n=a(7462),r=a(7294),l=a(2389),s=a(9443);var i=function(){var e=(0,r.useContext)(s.Z);if(null==e)throw new Error('"useUserPreferencesContext" is used outside of "Layout" component.');return e},p=a(3616),u=a(6010),o="tabItem_vU9c";function c(e){var t,a,n,l=e.lazy,s=e.block,c=e.defaultValue,d=e.values,m=e.groupId,g=e.className,y=r.Children.map(e.children,(function(e){if((0,r.isValidElement)(e)&&void 0!==e.props.value)return e;throw new Error("Docusaurus error: Bad <Tabs> child <"+("string"==typeof e.type?e.type:e.type.name)+'>: all children of the <Tabs> component should be <TabItem>, and every <TabItem> should have a unique "value" prop.')})),v=null!=d?d:y.map((function(e){var t=e.props;return{value:t.value,label:t.label}})),b=(0,p.lx)(v,(function(e,t){return e.value===t.value}));if(b.length>0)throw new Error('Docusaurus error: Duplicate values "'+b.map((function(e){return e.value})).join(", ")+'" found in <Tabs>. Every value needs to be unique.');var f=null===c?c:null!=(t=null!=c?c:null==(a=y.find((function(e){return e.props.default})))?void 0:a.props.value)?t:null==(n=y[0])?void 0:n.props.value;if(null!==f&&!v.some((function(e){return e.value===f})))throw new Error('Docusaurus error: The <Tabs> has a defaultValue "'+f+'" but none of its children has the corresponding value. Available values are: '+v.map((function(e){return e.value})).join(", ")+". If you intend to show no default tab, use defaultValue={null} instead.");var k=i(),h=k.tabGroupChoices,E=k.setTabGroupChoices,U=(0,r.useState)(f),N=U[0],M=U[1],w=[],I=(0,p.o5)().blockElementScrollPositionUntilNextRender;if(null!=m){var P=h[m];null!=P&&P!==N&&v.some((function(e){return e.value===P}))&&M(P)}var x=function(e){var t=e.currentTarget,a=w.indexOf(t),n=v[a].value;n!==N&&(I(t),M(n),null!=m&&E(m,n))},j=function(e){var t,a=null;switch(e.key){case"ArrowRight":var n=w.indexOf(e.currentTarget)+1;a=w[n]||w[0];break;case"ArrowLeft":var r=w.indexOf(e.currentTarget)-1;a=w[r]||w[w.length-1]}null==(t=a)||t.focus()};return r.createElement("div",{className:"tabs-container"},r.createElement("ul",{role:"tablist","aria-orientation":"horizontal",className:(0,u.Z)("tabs",{"tabs--block":s},g)},v.map((function(e){var t=e.value,a=e.label;return r.createElement("li",{role:"tab",tabIndex:N===t?0:-1,"aria-selected":N===t,className:(0,u.Z)("tabs__item",o,{"tabs__item--active":N===t}),key:t,ref:function(e){return w.push(e)},onKeyDown:j,onFocus:x,onClick:x},null!=a?a:t)}))),l?(0,r.cloneElement)(y.filter((function(e){return e.props.value===N}))[0],{className:"margin-vert--md"}):r.createElement("div",{className:"margin-vert--md"},y.map((function(e,t){return(0,r.cloneElement)(e,{key:t,hidden:e.props.value!==N})}))))}function d(e){var t=(0,l.Z)();return r.createElement(c,(0,n.Z)({key:String(t)},e))}},4637:function(e,t,a){a.r(t),a.d(t,{frontMatter:function(){return u},contentTitle:function(){return o},metadata:function(){return c},toc:function(){return d},default:function(){return g}});var n=a(7462),r=a(3366),l=(a(7294),a(3905)),s=a(6396),i=a(8215),p=["components"],u={title:"\u6570\u636e\u6301\u4e45\u5316",tags:["\u6570\u636e\u6301\u4e45\u5316","MyBatis","MyBatis-Plus"],sidebar_position:5,slug:"/advanced-guide/data-persistance"},o=void 0,c={unversionedId:"advanced-guide/\u6570\u636e\u6301\u4e45\u5316",id:"advanced-guide/\u6570\u636e\u6301\u4e45\u5316",title:"\u6570\u636e\u6301\u4e45\u5316",description:"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6 | \u6570\u636e\u6301\u4e45\u5316 | MyBatis Plus",source:"@site/docs/advanced-guide/\u6570\u636e\u6301\u4e45\u5316.md",sourceDirName:"advanced-guide",slug:"/advanced-guide/data-persistance",permalink:"/pangu-framework/docs/advanced-guide/data-persistance",editUrl:"https://gitee.com/pulanos/pangu-framework/tree/master/pangu-website/docs/advanced-guide/\u6570\u636e\u6301\u4e45\u5316.md",tags:[{label:"\u6570\u636e\u6301\u4e45\u5316",permalink:"/pangu-framework/docs/tags/\u6570\u636e\u6301\u4e45\u5316"},{label:"MyBatis",permalink:"/pangu-framework/docs/tags/my-batis"},{label:"MyBatis-Plus",permalink:"/pangu-framework/docs/tags/my-batis-plus"}],version:"current",sidebarPosition:5,frontMatter:{title:"\u6570\u636e\u6301\u4e45\u5316",tags:["\u6570\u636e\u6301\u4e45\u5316","MyBatis","MyBatis-Plus"],sidebar_position:5,slug:"/advanced-guide/data-persistance"},sidebar:"tutorialSidebar",previous:{title:"\u6ce8\u518c\u4e2d\u5fc3",permalink:"/pangu-framework/docs/advanced-guide/nacos-regist-center"},next:{title:"\u5206\u5e03\u5f0f\u591a\u7ea7\u7f13\u5b58",permalink:"/pangu-framework/docs/advanced-guide/layering-cache"}},d=[{value:"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6a21\u5757",id:"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6a21\u5757",children:[],level:2},{value:"\u672c\u5730\u914d\u7f6e",id:"\u672c\u5730\u914d\u7f6e",children:[],level:2},{value:"\u751f\u6210\u6301\u4e45\u5316\u6240\u9700\u7684\u6a21\u7248\u4ee3\u7801",id:"\u751f\u6210\u6301\u4e45\u5316\u6240\u9700\u7684\u6a21\u7248\u4ee3\u7801",children:[],level:2},{value:"\u57fa\u672c\u6570\u636e\u6301\u4e45\u5316\u64cd\u4f5c",id:"\u57fa\u672c\u6570\u636e\u6301\u4e45\u5316\u64cd\u4f5c",children:[{value:"\u65b0\u589e",id:"\u65b0\u589e",children:[],level:3},{value:"\u4fee\u6539",id:"\u4fee\u6539",children:[],level:3},{value:"\u5220\u9664",id:"\u5220\u9664",children:[],level:3},{value:"\u7b80\u5355\u67e5\u8be2",id:"\u7b80\u5355\u67e5\u8be2",children:[],level:3},{value:"\u5206\u9875\u67e5\u8be2",id:"\u5206\u9875\u67e5\u8be2",children:[{value:"\u57fa\u4e8e Mapper API \u7684\u5206\u9875\u67e5\u8be2",id:"\u57fa\u4e8e-mapper-api-\u7684\u5206\u9875\u67e5\u8be2",children:[],level:4},{value:"\u57fa\u4e8e\u624b\u5de5\u6620\u5c04 SQL \u7684\u5206\u9875\u67e5\u8be2",id:"\u57fa\u4e8e\u624b\u5de5\u6620\u5c04-sql-\u7684\u5206\u9875\u67e5\u8be2",children:[],level:4},{value:"\u4e00\u4e2a\u5b8c\u6574\u7684\u5206\u9875\u67e5\u8be2\u4f8b\u5b50",id:"\u4e00\u4e2a\u5b8c\u6574\u7684\u5206\u9875\u67e5\u8be2\u4f8b\u5b50",children:[],level:4}],level:3},{value:"\u624b\u5de5\u7f16\u5199SQL\u6620\u5c04",id:"\u624b\u5de5\u7f16\u5199sql\u6620\u5c04",children:[],level:3}],level:2},{value:"\u9ad8\u7ea7\u7279\u6027",id:"\u9ad8\u7ea7\u7279\u6027",children:[{value:"\u4e8b\u52a1",id:"\u4e8b\u52a1",children:[],level:3},{value:"\u903b\u8f91\u5220\u9664",id:"\u903b\u8f91\u5220\u9664",children:[{value:"\u914d\u7f6e\u8bf4\u660e",id:"\u914d\u7f6e\u8bf4\u660e",children:[],level:4}],level:3}],level:2},{value:"\u672c\u6587\u76f8\u5173\u8303\u4f8b\u6e90\u7801",id:"\u672c\u6587\u76f8\u5173\u8303\u4f8b\u6e90\u7801",children:[],level:2},{value:"\u4e0b\u4e00\u6b65",id:"\u4e0b\u4e00\u6b65",children:[],level:2}],m={toc:d};function g(e){var t=e.components,a=(0,r.Z)(e,p);return(0,l.kt)("wrapper",(0,n.Z)({},m,a,{components:t,mdxType:"MDXLayout"}),(0,l.kt)("head",null,(0,l.kt)("title",null,"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6 | \u6570\u636e\u6301\u4e45\u5316 | MyBatis Plus"),(0,l.kt)("meta",{name:"keywords",content:"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6 | \u6570\u636e\u6301\u4e45\u5316 | MyBatis Plus"}),(0,l.kt)("meta",{name:"description",content:"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6\u662f\u4e00\u5957\u8f7b\u91cf\u7a33\u5065\u7684\u5de5\u4e1a\u7ea7\u5206\u5e03\u5f0f\u5fae\u670d\u52a1\u5f00\u53d1\u6cbb\u7406\u6846\u67b6\uff08\u517c\u5bb9\u5355\u4f53\u5206\u5c42\u67b6\u6784\uff09"})),(0,l.kt)("p",null,"\u76d8\u53e4\u5f00\u53d1\u6570\u636e\u6301\u4e45\u5316 API \u4f9d\u8d56 MyBatis Plus \u63d0\u4f9b\u3002\u5728 MyBatis \u7684\u57fa\u7840\u4e0a\u63d0\u4f9b\u4e86\u5f3a\u5927\u7684\u5185\u7f6e\u901a\u7528 Mapper CRUD \u64cd\u4f5c\u3001\u652f\u6301 Lambda \u8868\u8fbe\u5f0f\u3001\u5185\u7f6e\u5c4f\u853d\u4e0d\u901a\u6570\u636e\u5e93\u65b9\u8a00\u5dee\u5f02\u7684\u5206\u9875\u63d2\u4ef6\u3001\u81ea\u52a8\u586b\u5145\u5b57\u6bb5\u503c\u3001\u591a\u79cd\u4e3b\u952e\u81ea\u52a8\u751f\u6210\u7b56\u7565\u3001\u903b\u8f91\u8f93\u51fa\u3001\u4e50\u89c2\u9501\u63d2\u4ef6\u7b49\u3002"),(0,l.kt)("details",null,(0,l.kt)("summary",null,(0,l.kt)("b",null,"\u5feb\u901f QA\uff1a"),"\u53ef\u4ee5\u652f\u6301\u517c\u5bb9\u54ea\u4e9b\u6570\u636e\u5e93\u7c7b\u578b\uff1f"),(0,l.kt)("div",null,"\u4e0e MyBatis Plus \u4e00\u81f4\u3002\u652f\u6301\u6240\u6709 JDBC \u6807\u51c6\u6570\u636e\u5e93\u3002\u5206\u9875\u65b9\u8a00\u517c\u5bb9\u5982\u4e0b\u6570\u636e\u5e93\uff1a mysql\u3001oracle\u3001db2\u3001h2\u3001hsql\u3001sqlite\u3001postgresql\u3001sqlserver\u3001phoenix\u3001gauss\u3001clickhouse\u3001sybase\u3001oceanbase\u3001firebird\u3001cubrid\u3001goldilocks\u3001csiidb\u3001\u8fbe\u68a6\u6570\u636e\u5e93\u3001\u865a\u8c37\u6570\u636e\u5e93\u3001\u4eba\u5927\u91d1\u4ed3\u6570\u636e\u5e93\u3001\u5357\u5927\u901a\u7528(\u534e\u5e93)\u6570\u636e\u5e93\u3001\u5357\u5927\u901a\u7528\u6570\u636e\u5e93\u3001\u795e\u901a\u6570\u636e\u5e93\u3001\u701a\u9ad8\u6570\u636e\u5e93\u3002")),(0,l.kt)("h2",{id:"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6a21\u5757"},"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6a21\u5757"),(0,l.kt)(s.Z,{mdxType:"Tabs"},(0,l.kt)(i.Z,{value:"parent",label:"\u76d8\u53e4 Parent",mdxType:"TabItem"},(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"<parent>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-parent</artifactId>\n    <version>latest.version.xxx</version>\n    <relativePath/>\n</parent>\n"))),(0,l.kt)(i.Z,{value:"dependency1",label:"\u57fa\u7840\u6a21\u5757",mdxType:"TabItem"},(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-spring-boot-starter</artifactId>\n</dependency>\n"))),(0,l.kt)(i.Z,{value:"dependency2",label:"JDBC \u6a21\u5757",mdxType:"TabItem"},(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n  <groupId>com.gitee.pulanos.pangu</groupId>\n  <artifactId>pangu-framework-jdbc-spring-boot-starter</artifactId>\n</dependency>\n")))),(0,l.kt)("h2",{id:"\u672c\u5730\u914d\u7f6e"},"\u672c\u5730\u914d\u7f6e"),(0,l.kt)("blockquote",null,(0,l.kt)("p",{parentName:"blockquote"},"\u4e3a\u4fbf\u4e8e\u7406\u89e3\uff0c\u672c\u6587\u57fa\u4e8e\u672c\u5730\u914d\u7f6e\u7684\u65b9\u5f0f\u7f16\u5199\u3002\u82e5\u6539\u4e3a\u6807\u51c6\u7684Nacos\u914d\u7f6e\u4e2d\u5fc3\u6a21\u5f0f\uff0c\u8bf7\u53c2\u9605:",(0,l.kt)("a",{parentName:"p",href:"/docs/advanced-guide/nacos-config-center"},"\u914d\u7f6e\u4e2d\u5fc3"),"\u7ae0\u8282\u3002")),(0,l.kt)(s.Z,{defaultValue:"application-dev",mdxType:"Tabs"},(0,l.kt)(i.Z,{value:"application",label:"application.properties",mdxType:"TabItem"},(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"spring.profiles.active=${spring.profiles.active:dev}\n"))),(0,l.kt)(i.Z,{value:"application-dev",label:"application-dev.properties",mdxType:"TabItem"},(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"spring.application.name=pangu-examples-crud\n\nspring.datasource.type=com.zaxxer.hikari.HikariDataSource\nspring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver\nspring.datasource.url=jdbc:mysql://localhost:3306/pangu-examples?useUnicode=true&characterEncoding=utf-8&autoReconnect=true&failOverReadOnly=false&allowMultiQueries=true&useSSL=false&rewriteBatchedStatements=true\nspring.datasource.username=root\nspring.datasource.password=root123456\nmybatis-plus.mapperLocations=classpath*:/mapper/**/*.xml\nmybatis-plus.configuration.log-impl=org.apache.ibatis.logging.slf4j.Slf4jImpl\n# \u5206\u9875SQL\u65b9\u8a00\u6570\u636e\u5e93\u7c7b\u578b\u6807\u8bc6\uff08\u7f3a\u7701\uff1a\u81ea\u52a8\u8bc6\u522b\uff09\npangu.jdbc.db-type=mysql\n\nlogging.level.root=INFO\nlogging.level.com.gitee.pulanos.pangu=INFO\nlogging.level.com.gitee.pulanos.pangu.showcases.crud.dao=debug\n")))),(0,l.kt)("h2",{id:"\u751f\u6210\u6301\u4e45\u5316\u6240\u9700\u7684\u6a21\u7248\u4ee3\u7801"},"\u751f\u6210\u6301\u4e45\u5316\u6240\u9700\u7684\u6a21\u7248\u4ee3\u7801"),(0,l.kt)("p",null,"\u57fa\u4e8e\u5b9e\u8df5\u7ecf\u9a8c\uff0c\u6211\u4eec\u5efa\u8bae\u4f7f\u7528\u76d8\u53e4\u4ee3\u7801\u751f\u6210\u5668\uff0c\u800c\u4e0d\u662f\u4f7f\u7528 Mybatis Plus \u5b98\u65b9\u751f\u6210\u5668\u3002\u5173\u4e8e\u751f\u6210\u4ee3\u7801\u76f8\u5173\u5185\u5bb9\uff0c\u8bf7\u53c2\u9605 ",(0,l.kt)("a",{parentName:"p",href:"/docs/code-generator"},"\u300a\u4ee3\u7801\u751f\u6210\u5668\u63d2\u4ef6\u300b")," \u7ae0\u8282\uff0c\u8fd9\u91cc\u4e0d\u518d\u8d58\u8ff0\u3002\uff08\u9488\u5bf9\u6bcf\u4e00\u4e2a\u6570\u636e\u8868\u4f1a\u751f\u6210\u4e00\u4e2a ",(0,l.kt)("inlineCode",{parentName:"p"},"*Mapper.java")," \u6587\u4ef6\u548c\u4e00\u4e2a ",(0,l.kt)("inlineCode",{parentName:"p"},"*Entity.java")," \u6587\u4ef6\uff09"),(0,l.kt)("h2",{id:"\u57fa\u672c\u6570\u636e\u6301\u4e45\u5316\u64cd\u4f5c"},"\u57fa\u672c\u6570\u636e\u6301\u4e45\u5316\u64cd\u4f5c"),(0,l.kt)("blockquote",null,(0,l.kt)("p",{parentName:"blockquote"},"\u8fd9\u91cc\u53ea\u662f\u7ed9\u51fa\u51e0\u4e2a\u7b80\u5355\u5178\u578b\u7684\u64cd\u4f5c\u4ee3\u7801\uff0c\u66f4\u591a\u5185\u5bb9\u8bf7\u53c2\u9605\u8303\u4f8b\u6216\u9605\u8bfb ",(0,l.kt)("a",{parentName:"p",href:"https://baomidou.com/pages/24112f/"},"Mybatis Plus \u5b98\u65b9\u6587\u6863"),"\u3002")),(0,l.kt)("h3",{id:"\u65b0\u589e"},"\u65b0\u589e"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},'UserEntity userEntity = new UserEntity();\nuserEntity.setName("XC").setAge(18).setUserType("1");\nint row = userMapper.insert(userEntity);\nlog.info("\u6210\u529f\u63d2\u5165{}\u6761\u6570\u636e\u3002{}", row, userEntity);\n')),(0,l.kt)("h3",{id:"\u4fee\u6539"},"\u4fee\u6539"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},'//\u65b9\u5f0f1\nuserMapper.updateById(new UserEntity().setId(1L).setName("XC2"));\n\n//\u65b9\u5f0f2\nLambdaUpdateWrapper<UserEntity> updateWrapper = Wrappers.lambdaUpdate();\nupdateWrapper.set(UserEntity::getAge, 100);\nupdateWrapper.eq(UserEntity::getId, 2L);\nuserMapper.update(null, updateWrapper);\n//\u65b9\u5f0f2\u7b80\u5199\nuserMapper.update(null, Wrappers.<UserEntity>lambdaUpdate().set(UserEntity::getName, "XC2").eq(UserEntity::getId, 3L));\n\n//\u65b9\u5f0f3\nUserEntity userEntity = new UserEntity();\nuserEntity.setName("XC2");\nuserMapper.update(userEntity, Wrappers.<UserEntity>lambdaUpdate().eq(UserEntity::getId, 4L));\n')),(0,l.kt)("h3",{id:"\u5220\u9664"},"\u5220\u9664"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"//\u65b9\u5f0f1\nuserMapper.deleteById(1000L);\n\n//\u65b9\u5f0f2\nuserMapper.deleteBatchIds(Arrays.asList(1000L, 1001L));\n\n//\u65b9\u5f0f3\nuserMapper.delete(Wrappers.<UserEntity>lambdaQuery().ge(UserEntity::getAge, 150));\nuserMapper.delete(Wrappers.lambdaQuery(UserEntity.class).ge(UserEntity::getAge, 150));\n\n//\u65b9\u5f0f4\nuserMapper.deleteById(new UserEntity().setId(2000L));\n")),(0,l.kt)("h3",{id:"\u7b80\u5355\u67e5\u8be2"},"\u7b80\u5355\u67e5\u8be2"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},'//\u65b9\u5f0f1\nUserEntity userEntity = userMapper.selectById(1L);\n\n//\u65b9\u5f0f2\nUserEntity userEntity1 = userMapper.selectOne(Wrappers.<UserEntity>lambdaQuery().eq(UserEntity::getId, 1L));\n\n//\u65b9\u5f0f3 (\u9700\u8981\u6ce8\u610f\u5bf9\u4f20\u5165 ID \u96c6\u5408\u4e3a\u975e\u7a7a\u5224\u65ad\uff0c\u5426\u5219\u751f\u6210\u7684 SQL in() \u8bed\u6cd5\u5c06\u62a5\u9519)\nif(CollUtil.isNotEmpty(userIds)){\n    userEntities = userMapper.selectBatchIds(userIds);\n}\n\n//\u65b9\u5f0f4\nLambdaQueryWrapper<UserEntity> lambdaQueryWrapper = Wrappers.lambdaQuery();\n//\u52a8\u6001\u7ec4\u5408\u67e5\u8be2\u6761\u4ef6\u7684\u7b80\u4fbf\u5199\u6cd5\nlambdaQueryWrapper.between(ObjectUtil.isNotEmpty(age), UserEntity::getAge, 1, age);\nlambdaQueryWrapper.eq(UserEntity::getUserType, "1");\nlambdaQueryWrapper.orderByDesc(UserEntity::getId);\nList<UserEntity> userEntities1 = userMapper.selectList(lambdaQueryWrapper);\n\n//\u65b9\u5f0f5\nLambdaQueryWrapper<UserRoleEntity> lambdaQueryWrapper = Wrappers.lambdaQuery();\nlambdaQueryWrapper.eq(UserRoleEntity::getUserId, userId).orderByDesc(UserRoleEntity::getRoleId);\nList<UserRoleEntity> userRoleEntities = userRoleMapper.selectList(lambdaQueryWrapper);\nList<Long> roleIds = userRoleEntities.stream().map(UserRoleEntity::getRoleId).collect(Collectors.toList());\n\n//\u65b9\u5f0f6\nList<Map<String, Object>> userMaps = userMapper.selectMaps(Wrappers.<UserEntity>lambdaQuery().eq(UserEntity::getUserType, "1"));\n\n//\u65b9\u5f0f7 count \u67e5\u8be2\nLong cnt = userMapper.selectCount(Wrappers.<UserEntity>lambdaQuery().le(UserEntity::getGmtCreate, DateUtil.date()));\n\n//\u65b9\u5f0f8 group \u67e5\u8be2\nQueryWrapper<UserEntity> queryWrapper1 = Wrappers.query();\nqueryWrapper1.select("age, count(id) as cnt").groupBy("age");\nList<Map<String, Object>> mapList = userMapper.selectMaps(queryWrapper1);\n\n//\u65b9\u5f0f9 or \u67e5\u8be2\nif (ObjectUtil.isNotEmpty(keyword)){\n    lambdaQueryWrapper.and(w -> w.like( UserEntity::getName, keyword).or().like(UserEntity::getUserName, keyword));\n}\n\n//\u65b9\u5f0f10 \u6307\u5b9a\u67e5\u8be2\u5b57\u6bb5\nLambdaQueryWrapper<UserEntity> lambdaQueryWrapper = Wrappers.lambdaQuery();\nlambdaQueryWrapper.select(UserEntity::getId, UserEntity::getUserName);\nlambdaQueryWrapper.eq(...);\n\n//\u65b9\u5f0f11 \u6392\u9664\u67e5\u8be2\u5b57\u6bb5\nlambdaQueryWrapper.select(UserEntity.class, info -> !info.getColumn().equals("password") && !info.getColumn().equals("password2"));\n')),(0,l.kt)("h3",{id:"\u5206\u9875\u67e5\u8be2"},"\u5206\u9875\u67e5\u8be2"),(0,l.kt)("p",null,"\u76d8\u53e4\u6846\u67b6\u5df2\u7ecf\u505a\u4e86 Mybatis Plus \u5206\u9875\u63d2\u4ef6\u7684\u81ea\u52a8\u88c5\u914d\u5de5\u4f5c\uff0c\u76f4\u63a5\u4f7f\u7528\u5373\u53ef\u3002\u65e0\u9700\u989d\u5916\u914d\u7f6e\u3002"),(0,l.kt)("h4",{id:"\u57fa\u4e8e-mapper-api-\u7684\u5206\u9875\u67e5\u8be2"},"\u57fa\u4e8e Mapper API \u7684\u5206\u9875\u67e5\u8be2"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},'public void aPageQuery(){\n    log.info("MyBatisPlus API \u5206\u9875\u67e5\u8be2\u6570\u636e...");\n    Page page = new Page<UserEntity>(1,3);\n    userMapper.selectPage(page, Wrappers.<UserEntity>lambdaQuery().ge(UserEntity::getAge, 10).orderByAsc(UserEntity::getId));\n    Console.log("\u603b\u6570\uff1a{}", page.getTotal());\n    List<UserEntity> userEntities = page.getRecords();\n    userEntities.forEach(System.out::println);\n}\n')),(0,l.kt)("h4",{id:"\u57fa\u4e8e\u624b\u5de5\u6620\u5c04-sql-\u7684\u5206\u9875\u67e5\u8be2"},"\u57fa\u4e8e\u624b\u5de5\u6620\u5c04 SQL \u7684\u5206\u9875\u67e5\u8be2"),(0,l.kt)("p",null,"\u7ee7\u7eed\u9605\u8bfb\u672c\u6587\u540e\u9762\u7684 ",(0,l.kt)("a",{parentName:"p",href:"#%E6%89%8B%E5%B7%A5%E7%BC%96%E5%86%99sql%E6%98%A0%E5%B0%84"},"\u300a\u624b\u5de5\u7f16\u5199SQL\u6620\u5c04\u300b")," \u7ae0\u8282\u53ef\u4ee5\u627e\u5230\u3002"),(0,l.kt)("h4",{id:"\u4e00\u4e2a\u5b8c\u6574\u7684\u5206\u9875\u67e5\u8be2\u4f8b\u5b50"},"\u4e00\u4e2a\u5b8c\u6574\u7684\u5206\u9875\u67e5\u8be2\u4f8b\u5b50"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},'// \u5206\u9875\u5165\u53c2\u5bf9\u8c61\npublic class RoleIn extends Page {\n    private String name;\n}\n\n// Controller\n@GetMapping("/list")\npublic Result<PageResult<RoleEntity>> list(RoleIn roleIn) {\n    PageResult<RoleEntity> pageResult = roleService.list(roleIn);\n    return Result.success(pageResult);\n}\n\n// Service\u5b9e\u73b0\npublic PageResult<RoleEntity> list(RoleIn roleIn) {\n    Page<RoleEntity> page = PagingUtil.createPage(roleIn);\n    LambdaQueryWrapper<RoleEntity> lambdaQueryWrapper = Wrappers.lambdaQuery();\n    lambdaQueryWrapper.like(ObjectUtil.isNotEmpty(roleIn.getName()), RoleEntity::getName, roleIn.getName());\n    roleMapper.selectPage(page, lambdaQueryWrapper);\n    return PagingUtil.getPageResult(page);\n}\n')),(0,l.kt)("h3",{id:"\u624b\u5de5\u7f16\u5199sql\u6620\u5c04"},"\u624b\u5de5\u7f16\u5199SQL\u6620\u5c04"),(0,l.kt)("div",{className:"admonition admonition-tip alert alert--success"},(0,l.kt)("div",{parentName:"div",className:"admonition-heading"},(0,l.kt)("h5",{parentName:"div"},(0,l.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,l.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"12",height:"16",viewBox:"0 0 12 16"},(0,l.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M6.5 0C3.48 0 1 2.19 1 5c0 .92.55 2.25 1 3 1.34 2.25 1.78 2.78 2 4v1h5v-1c.22-1.22.66-1.75 2-4 .45-.75 1-2.08 1-3 0-2.81-2.48-5-5.5-5zm3.64 7.48c-.25.44-.47.8-.67 1.11-.86 1.41-1.25 2.06-1.45 3.23-.02.05-.02.11-.02.17H5c0-.06 0-.13-.02-.17-.2-1.17-.59-1.83-1.45-3.23-.2-.31-.42-.67-.67-1.11C2.44 6.78 2 5.65 2 5c0-2.2 2.02-4 4.5-4 1.22 0 2.36.42 3.22 1.19C10.55 2.94 11 3.94 11 5c0 .66-.44 1.78-.86 2.48zM4 14h5c-.23 1.14-1.3 2-2.5 2s-2.27-.86-2.5-2z"}))),"tip")),(0,l.kt)("div",{parentName:"div",className:"admonition-content"},(0,l.kt)("p",{parentName:"div"},"\u4e00\u822c\u6765\u8bf4\u5728\u65e5\u5e38\u5f00\u53d1\u4e2d\u6211\u4eec\u662f\u4e0d\u9700\u8981\u518d\u7f16\u5199SQL\u4ee3\u7801\u7684\uff0cMapper API\u5df2\u7ecf\u80fd\u6ee1\u8db3\u6211\u4eec\u7684\u9700\u6c42\u4e86\u3002\u4f46\u5bf9\u4e8e\u4e00\u4e9b\u7279\u6b8a\u9700\u6c42\uff0c\u6211\u4eec\u4e5f\u53ef\u4ee5\u624b\u5de5\u5199SQL\u6620\u5c04\u7684\u65b9\u5f0f\u6765\u5904\u7406\u3002\u5982\u4e0b\u8303\u4f8b\u6f14\u793a\u4e86\u624b\u5de5SQL\u67e5\u8be2\u7684\u64cd\u4f5c\uff0c\u65b0\u589e\u3001\u4fee\u6539\u3001\u5220\u9664\u4e5f\u662f\u540c\u7406\u3002"))),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx",metastring:"{6,15}","{6,15}":!0},'public void bPageQuery(){\n    log.info("\u81ea\u5b9a\u4e49SQL\u6620\u5c04\u5206\u9875\u67e5\u8be2\u6570\u636e...");\n    Page page = new Page<UserEntity>(1,3);\n    Map<String, Object> params = Maps.newHashMap();\n    params.put("userType", "1");\n    List<UserEntity> userEntities = crudMapper.listUsersByPage(page, params);\n    Console.log("\u603b\u6570\uff1a{}", page.getTotal());\n    userEntities.forEach(System.out::println);\n}\n\npublic void cPageQuery(){\n    log.info("\u81ea\u5b9a\u4e49SQL\u6620\u5c04\u5206\u9875\u67e5\u8be2\u6570\u636e...");\n    Page page = new Page<Map<String, Object>>(1,3);\n    String userType = "1";\n    List<Map<String, Object>> userMaps = crudMapper.listUserMapsByPage(page, userType);\n    Console.log("\u603b\u6570\uff1a{}", page.getTotal());\n    userMaps.forEach(System.out::println);\n}\n\npublic void bSelect() {\n    log.info("\u81ea\u5b9a\u4e49SQL\u6620\u5c04\u67e5\u8be2\u6570\u636e...");\n    Map<String, Object> params = Maps.newHashMap();\n    params.put("userType", "1");\n    List<UserEntity> userEntities = crudMapper.listUsersByMap(params);\n    userEntities.forEach(System.out::println);\n}\n')),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx",metastring:'title="src/main/java/com/gitee/pulanos/pangu/showcases/crud/dao/mapper/CrudMapper.java"',title:'"src/main/java/com/gitee/pulanos/pangu/showcases/crud/dao/mapper/CrudMapper.java"'},"/**\n * \u63d0\u793a\uff1a\u81ea\u5b9a\u4e49sql\u624b\u5de5\u6620\u5c04\u5927\u90e8\u5206\u65f6\u5019\u4e3a\u590d\u6742\u7684\u591a\u8868\u8054\u5408\u67e5\u8be2\u7684SQL\uff0c\u5355\u8868\u64cd\u4f5c\u90fd\u5e94\u8be5\u7edf\u4e00\u4f7f\u7528mybatis plus\u7684API\n */\n@Mapper\npublic interface CrudMapper {\n\n    List<UserEntity> listUsersByPage(Page<UserEntity> page, Map<String, Object> param);\n\n    List<Map<String, Object>> listUserMapsByPage(Page<Map<String, Object>> page, String userType);\n\n    List<UserEntity> listUsersByMap(Map<String, Object> param);\n\n}\n")),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx",metastring:'title="src/main/resources/mapper/CrudMapper.xml"',title:'"src/main/resources/mapper/CrudMapper.xml"'},'<mapper namespace="com.gitee.pulanos.pangu.showcases.crud.dao.mapper.CrudMapper">\n\x3c!-- \u5206\u9875\u67e5\u8be2 --\x3e\n<select id="listUsersByPage" resultType="com.gitee.pulanos.pangu.showcases.crud.dao.entity.UserEntity">\n    select id,name,age,user_type,gmt_create,gmt_update from user\n    <where>\n        <if test="param.userType!=null and param.userType!=\'\'">\n            user_type = #{param.userType}\n        </if>\n    </where>\n    ORDER BY id\n</select>\n\n\x3c!-- \u5206\u9875\u67e5\u8be2 --\x3e\n<select id="listUserMapsByPage" resultType="java.util.Map">\n    select age, count(id) as userCnt from user\n    <where>\n        <if test="userType!=null and userType!=\'\'">\n            user_type = #{userType}\n        </if>\n    </where>\n    GROUP BY age\n    ORDER BY age DESC\n</select>\n\n\x3c!-- \u666e\u901a\u67e5\u8be2 --\x3e\n<select id="listUsersByMap" resultType="com.gitee.pulanos.pangu.showcases.crud.dao.entity.UserEntity">\n    select id,name,age,user_type,gmt_create,gmt_update from user\n    <where>\n        <if test="userType!=null and userType!=\'\'">\n            user_type = #{userType}\n        </if>\n    </where>\n</select>\n</mapper>\n')),(0,l.kt)("h2",{id:"\u9ad8\u7ea7\u7279\u6027"},"\u9ad8\u7ea7\u7279\u6027"),(0,l.kt)("h3",{id:"\u4e8b\u52a1"},"\u4e8b\u52a1"),(0,l.kt)("p",null,"\u5355\u4e00\u6570\u636e\u6e90\u4e8b\u52a1\uff0c\u76f4\u63a5\u4f7f\u7528 Spring \u4e8b\u52a1\u76f8\u5173\u6ce8\u89e3\u5373\u53ef\uff08 ",(0,l.kt)("inlineCode",{parentName:"p"},"@EnableTransactionManagement"),"\u3001",(0,l.kt)("inlineCode",{parentName:"p"},"@Transactional")," \uff09\u3002\u5bf9\u4e8e\u5206\u5e03\u5f0f\u4e8b\u52a1\u8bf7\u53c2\u9605 ",(0,l.kt)("a",{parentName:"p",href:"/docs/advanced-guide/distributed-transaction"},"\u300a\u5206\u5e03\u5f0f\u4e8b\u52a1\u300b")," \u7ae0\u8282\u3002"),(0,l.kt)("h3",{id:"\u903b\u8f91\u5220\u9664"},"\u903b\u8f91\u5220\u9664"),(0,l.kt)("p",null,"\u76d8\u53e4\u6846\u67b6\u501f\u52a9 Mybatis Plus \u5bf9\u903b\u8f91\u5220\u9664\u63d0\u4f9b\u4e86\u975e\u5e38\u53cb\u597d\u7684\u652f\u6301\u3002\u901a\u8fc7\u5982\u4e0b\u7b80\u5355\u914d\u7f6e\u5373\u53ef\u5b9e\u73b0\u4ece\u7269\u7406\u5220\u9664\u5230\u903b\u8f91\u5220\u9664\u5728 CRUD \u4e0a\u9762\u7684\u65e0\u611f\u4f53\u9a8c\u3002"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"# \u6307\u5b9a\u903b\u8f91\u5220\u9664\u7684\u6807\u8bc6\u5b57\u6bb5\nmybatis-plus.global-config.db-config.logic-delete-field=deleted\n# \u5220\u9664\u524d\u7684\u7f3a\u7701\u503c\nmybatis-plus.global-config.db-config.logic-not-delete-value=0\n# \u5220\u9664\u540e\u7684\u503c\nmybatis-plus.global-config.db-config.logic-delete-value=id\n")),(0,l.kt)("h4",{id:"\u914d\u7f6e\u8bf4\u660e"},"\u914d\u7f6e\u8bf4\u660e"),(0,l.kt)("ul",null,(0,l.kt)("li",{parentName:"ul"},"\u903b\u8f91\u5220\u9664\u5b57\u6bb5 deleted \u5efa\u8bae\u901a\u8fc7\u6570\u636e\u5e93\u8bbe\u7f6e\u9ed8\u8ba4\u503c 0\u3002"),(0,l.kt)("li",{parentName:"ul"},"\u5220\u9664\u540e\u7684\u503c\u5efa\u8bae\u4e0d\u7528 1\uff0c\u8fd9\u4f1a\u5e26\u6765\u67d0\u5b57\u6bb5\u9700\u8981\u552f\u4e00\u7d22\u5f15\u65f6\u7684\u5c34\u5c2c\u95ee\u9898\u3002\u56e0\u6b64\u5efa\u8bae\u5c06\u5220\u9664\u540e\u7684\u503c\u66f4\u65b0\u4e3a\u5f53\u524d\u8bb0\u5f55\u7684 ID \u5b57\u6bb5\u503c\uff0c\u5982\u4e0a\u914d\u7f6e\u6240\u793a\u3002\u8fd9\u65f6\u5982\u679c\u8868\u4e2d\u67d0\u5b57\u6bb5\u9700\u8981\u5efa\u7acb\u552f\u4e00\u7d22\u5f15\uff0c\u5219\u53ef\u4ee5\u548c deleted \u5b57\u6bb5\u4e00\u8d77\u521b\u5efa\u8054\u5408\u552f\u4e00\u7d22\u5f15\u3002"),(0,l.kt)("li",{parentName:"ul"},"\u67e5\u8be2\u548c\u66f4\u65b0\u64cd\u4f5c\uff0c\u6846\u67b6\u4f1a\u81ea\u52a8\u62fc\u63a5\u903b\u8f91\u5220\u9664\u5b57\u6bb5\u4f5c\u4e3a\u6761\u4ef6\u3002\uff08AND deleted = 0\uff09")),(0,l.kt)("h2",{id:"\u672c\u6587\u76f8\u5173\u8303\u4f8b\u6e90\u7801"},"\u672c\u6587\u76f8\u5173\u8303\u4f8b\u6e90\u7801"),(0,l.kt)("ul",null,(0,l.kt)("li",{parentName:"ul"},(0,l.kt)("a",{parentName:"li",href:"https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-crud"},"pangu-examples-crud"),"\uff1a\u6570\u636e\u6301\u4e45\u5316\u53c2\u8003\u8303\u4f8b")),(0,l.kt)("h2",{id:"\u4e0b\u4e00\u6b65"},"\u4e0b\u4e00\u6b65"),(0,l.kt)("p",null,"\u7ee7\u7eed\u9605\u8bfb\u5176\u5b83\u7ae0\u8282\u83b7\u53d6\u4f60\u60f3\u8981\u7684\u7b54\u6848\u6216\u901a\u8fc7\u6211\u4eec\u7684 ",(0,l.kt)("a",{parentName:"p",href:"/docs/community"},"\u5f00\u53d1\u8005\u793e\u533a")," \u5bfb\u6c42\u66f4\u591a\u5e2e\u52a9\u3002"))}g.isMDXComponent=!0}}]);