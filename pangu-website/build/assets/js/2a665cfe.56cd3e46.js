"use strict";(self.webpackChunkpangu_website=self.webpackChunkpangu_website||[]).push([[5162],{3905:function(e,t,a){a.d(t,{Zo:function(){return o},kt:function(){return m}});var n=a(7294);function r(e,t,a){return t in e?Object.defineProperty(e,t,{value:a,enumerable:!0,configurable:!0,writable:!0}):e[t]=a,e}function l(e,t){var a=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),a.push.apply(a,n)}return a}function i(e){for(var t=1;t<arguments.length;t++){var a=null!=arguments[t]?arguments[t]:{};t%2?l(Object(a),!0).forEach((function(t){r(e,t,a[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(a)):l(Object(a)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(a,t))}))}return e}function s(e,t){if(null==e)return{};var a,n,r=function(e,t){if(null==e)return{};var a,n,r={},l=Object.keys(e);for(n=0;n<l.length;n++)a=l[n],t.indexOf(a)>=0||(r[a]=e[a]);return r}(e,t);if(Object.getOwnPropertySymbols){var l=Object.getOwnPropertySymbols(e);for(n=0;n<l.length;n++)a=l[n],t.indexOf(a)>=0||Object.prototype.propertyIsEnumerable.call(e,a)&&(r[a]=e[a])}return r}var p=n.createContext({}),d=function(e){var t=n.useContext(p),a=t;return e&&(a="function"==typeof e?e(t):i(i({},t),e)),a},o=function(e){var t=d(e.components);return n.createElement(p.Provider,{value:t},e.children)},u={inlineCode:"code",wrapper:function(e){var t=e.children;return n.createElement(n.Fragment,{},t)}},c=n.forwardRef((function(e,t){var a=e.components,r=e.mdxType,l=e.originalType,p=e.parentName,o=s(e,["components","mdxType","originalType","parentName"]),c=d(a),m=r,g=c["".concat(p,".").concat(m)]||c[m]||u[m]||l;return a?n.createElement(g,i(i({ref:t},o),{},{components:a})):n.createElement(g,i({ref:t},o))}));function m(e,t){var a=arguments,r=t&&t.mdxType;if("string"==typeof e||r){var l=a.length,i=new Array(l);i[0]=c;var s={};for(var p in t)hasOwnProperty.call(t,p)&&(s[p]=t[p]);s.originalType=e,s.mdxType="string"==typeof e?e:r,i[1]=s;for(var d=2;d<l;d++)i[d]=a[d];return n.createElement.apply(null,i)}return n.createElement.apply(null,a)}c.displayName="MDXCreateElement"},8215:function(e,t,a){var n=a(7294);t.Z=function(e){var t=e.children,a=e.hidden,r=e.className;return n.createElement("div",{role:"tabpanel",hidden:a,className:r},t)}},6396:function(e,t,a){a.d(t,{Z:function(){return c}});var n=a(7462),r=a(7294),l=a(2389),i=a(9443);var s=function(){var e=(0,r.useContext)(i.Z);if(null==e)throw new Error('"useUserPreferencesContext" is used outside of "Layout" component.');return e},p=a(3616),d=a(6010),o="tabItem_vU9c";function u(e){var t,a,n,l=e.lazy,i=e.block,u=e.defaultValue,c=e.values,m=e.groupId,g=e.className,v=r.Children.map(e.children,(function(e){if((0,r.isValidElement)(e)&&void 0!==e.props.value)return e;throw new Error("Docusaurus error: Bad <Tabs> child <"+("string"==typeof e.type?e.type:e.type.name)+'>: all children of the <Tabs> component should be <TabItem>, and every <TabItem> should have a unique "value" prop.')})),k=null!=c?c:v.map((function(e){var t=e.props;return{value:t.value,label:t.label}})),h=(0,p.lx)(k,(function(e,t){return e.value===t.value}));if(h.length>0)throw new Error('Docusaurus error: Duplicate values "'+h.map((function(e){return e.value})).join(", ")+'" found in <Tabs>. Every value needs to be unique.');var N=null===u?u:null!=(t=null!=u?u:null==(a=v.find((function(e){return e.props.default})))?void 0:a.props.value)?t:null==(n=v[0])?void 0:n.props.value;if(null!==N&&!k.some((function(e){return e.value===N})))throw new Error('Docusaurus error: The <Tabs> has a defaultValue "'+N+'" but none of its children has the corresponding value. Available values are: '+k.map((function(e){return e.value})).join(", ")+". If you intend to show no default tab, use defaultValue={null} instead.");var b=s(),f=b.tabGroupChoices,y=b.setTabGroupChoices,E=(0,r.useState)(N),T=E[0],w=E[1],x=[],S=(0,p.o5)().blockElementScrollPositionUntilNextRender;if(null!=m){var B=f[m];null!=B&&B!==T&&k.some((function(e){return e.value===B}))&&w(B)}var A=function(e){var t=e.currentTarget,a=x.indexOf(t),n=k[a].value;n!==T&&(S(t),w(n),null!=m&&y(m,n))},I=function(e){var t,a=null;switch(e.key){case"ArrowRight":var n=x.indexOf(e.currentTarget)+1;a=x[n]||x[0];break;case"ArrowLeft":var r=x.indexOf(e.currentTarget)-1;a=x[r]||x[x.length-1]}null==(t=a)||t.focus()};return r.createElement("div",{className:"tabs-container"},r.createElement("ul",{role:"tablist","aria-orientation":"horizontal",className:(0,d.Z)("tabs",{"tabs--block":i},g)},k.map((function(e){var t=e.value,a=e.label;return r.createElement("li",{role:"tab",tabIndex:T===t?0:-1,"aria-selected":T===t,className:(0,d.Z)("tabs__item",o,{"tabs__item--active":T===t}),key:t,ref:function(e){return x.push(e)},onKeyDown:I,onFocus:A,onClick:A},null!=a?a:t)}))),l?(0,r.cloneElement)(v.filter((function(e){return e.props.value===T}))[0],{className:"margin-vert--md"}):r.createElement("div",{className:"margin-vert--md"},v.map((function(e,t){return(0,r.cloneElement)(e,{key:t,hidden:e.props.value!==T})}))))}function c(e){var t=(0,l.Z)();return r.createElement(u,(0,n.Z)({key:String(t)},e))}},8149:function(e,t,a){a.r(t),a.d(t,{frontMatter:function(){return d},contentTitle:function(){return o},metadata:function(){return u},toc:function(){return c},default:function(){return g}});var n=a(7462),r=a(3366),l=(a(7294),a(3905)),i=a(6396),s=a(8215),p=["components"],d={title:"\u6570\u636e\u6cbb\u7406\u4e4b\u8bfb\u5199\u5206\u79bb",tags:["\u6570\u636e\u5206\u7247","\u8bfb\u5199\u5206\u79bb","\u6570\u636e\u6301\u4e45\u5316"],sidebar_position:25,slug:"/advanced-guide/readwrite-splitting"},o=void 0,u={unversionedId:"advanced-guide/\u6570\u636e\u6cbb\u7406\u4e4b\u8bfb\u5199\u5206\u79bb",id:"advanced-guide/\u6570\u636e\u6cbb\u7406\u4e4b\u8bfb\u5199\u5206\u79bb",title:"\u6570\u636e\u6cbb\u7406\u4e4b\u8bfb\u5199\u5206\u79bb",description:"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6 | \u6570\u636e\u6cbb\u7406\u4e4b\u8bfb\u5199\u5206\u79bb | ShardingSphere-JDBC",source:"@site/docs/advanced-guide/\u6570\u636e\u6cbb\u7406\u4e4b\u8bfb\u5199\u5206\u79bb.md",sourceDirName:"advanced-guide",slug:"/advanced-guide/readwrite-splitting",permalink:"/pangu-framework/docs/advanced-guide/readwrite-splitting",editUrl:"https://gitee.com/pulanos/pangu-framework/tree/master/pangu-website/docs/advanced-guide/\u6570\u636e\u6cbb\u7406\u4e4b\u8bfb\u5199\u5206\u79bb.md",tags:[{label:"\u6570\u636e\u5206\u7247",permalink:"/pangu-framework/docs/tags/\u6570\u636e\u5206\u7247"},{label:"\u8bfb\u5199\u5206\u79bb",permalink:"/pangu-framework/docs/tags/\u8bfb\u5199\u5206\u79bb"},{label:"\u6570\u636e\u6301\u4e45\u5316",permalink:"/pangu-framework/docs/tags/\u6570\u636e\u6301\u4e45\u5316"}],version:"current",sidebarPosition:25,frontMatter:{title:"\u6570\u636e\u6cbb\u7406\u4e4b\u8bfb\u5199\u5206\u79bb",tags:["\u6570\u636e\u5206\u7247","\u8bfb\u5199\u5206\u79bb","\u6570\u636e\u6301\u4e45\u5316"],sidebar_position:25,slug:"/advanced-guide/readwrite-splitting"},sidebar:"tutorialSidebar",previous:{title:"\u6d88\u606f\u961f\u5217",permalink:"/pangu-framework/docs/advanced-guide/mq"},next:{title:"\u4ee3\u7801\u751f\u6210\u5668\u63d2\u4ef6",permalink:"/pangu-framework/docs/code-generator"}},c=[{value:"\u8bfb\u5199\u5206\u79bb\u6982\u5ff5",id:"\u8bfb\u5199\u5206\u79bb\u6982\u5ff5",children:[{value:"\u76f8\u5173\u4e13\u4e1a\u672f\u8bed",id:"\u76f8\u5173\u4e13\u4e1a\u672f\u8bed",children:[],level:3},{value:"\u8bfb\u5199\u5206\u79bb\u540e\u9762\u4e34\u7684\u95ee\u9898",id:"\u8bfb\u5199\u5206\u79bb\u540e\u9762\u4e34\u7684\u95ee\u9898",children:[],level:3}],level:2},{value:"\u8bfb\u5199\u5206\u79bb\u5b9e\u73b0\u539f\u7406",id:"\u8bfb\u5199\u5206\u79bb\u5b9e\u73b0\u539f\u7406",children:[{value:"\u6280\u672f\u65b9\u6848\u6307\u6807\u5bf9\u6bd4",id:"\u6280\u672f\u65b9\u6848\u6307\u6807\u5bf9\u6bd4",children:[],level:3}],level:2},{value:"\u7f16\u7a0b\u5b9e\u6218",id:"\u7f16\u7a0b\u5b9e\u6218",children:[{value:"\u521d\u59cb\u5316\u6570\u636e\u5e93\u73af\u5883",id:"\u521d\u59cb\u5316\u6570\u636e\u5e93\u73af\u5883",children:[],level:3},{value:"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6a21\u5757",id:"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6a21\u5757",children:[],level:3},{value:"\u672c\u5730\u914d\u7f6e",id:"\u672c\u5730\u914d\u7f6e",children:[],level:3},{value:"\u4e3b\u8981\u903b\u8f91\u4ee3\u7801",id:"\u4e3b\u8981\u903b\u8f91\u4ee3\u7801",children:[{value:"\u8bfb\u64cd\u4f5c\u81ea\u52a8\u8d70\u4ece\u5e93\u8d1f\u8f7d\u5747\u8861",id:"\u8bfb\u64cd\u4f5c\u81ea\u52a8\u8d70\u4ece\u5e93\u8d1f\u8f7d\u5747\u8861",children:[],level:4},{value:"\u8bfb\u64cd\u4f5c\u5f3a\u5236\u8d70\u4e3b\u5e93",id:"\u8bfb\u64cd\u4f5c\u5f3a\u5236\u8d70\u4e3b\u5e93",children:[],level:4},{value:"\u5199\u64cd\u4f5c\u81ea\u52a8\u8d70\u4e3b\u5e93",id:"\u5199\u64cd\u4f5c\u81ea\u52a8\u8d70\u4e3b\u5e93",children:[],level:4},{value:"\u4e8b\u52a1\u65b9\u6cd5\u91cc\u7684\u6240\u6709\u8bfb\u5199\u64cd\u4f5c\u90fd\u81ea\u52a8\u8d70\u4e3b\u5e93",id:"\u4e8b\u52a1\u65b9\u6cd5\u91cc\u7684\u6240\u6709\u8bfb\u5199\u64cd\u4f5c\u90fd\u81ea\u52a8\u8d70\u4e3b\u5e93",children:[],level:4}],level:3}],level:2},{value:"\u6d4b\u8bd5",id:"\u6d4b\u8bd5",children:[{value:"\u542f\u52a8\u7c7b",id:"\u542f\u52a8\u7c7b",children:[],level:3},{value:"\u6d4b\u8bd5\u7528\u4f8b",id:"\u6d4b\u8bd5\u7528\u4f8b",children:[{value:"\u6d4b\u8bd5\u8bfb\u64cd\u4f5c\u81ea\u52a8\u8d70\u4ece\u5e93\u8d1f\u8f7d\u5747\u8861",id:"\u6d4b\u8bd5\u8bfb\u64cd\u4f5c\u81ea\u52a8\u8d70\u4ece\u5e93\u8d1f\u8f7d\u5747\u8861",children:[],level:4},{value:"\u6d4b\u8bd5\u8bfb\u64cd\u4f5c\u5f3a\u5236\u8d70\u4e3b\u5e93",id:"\u6d4b\u8bd5\u8bfb\u64cd\u4f5c\u5f3a\u5236\u8d70\u4e3b\u5e93",children:[],level:4},{value:"\u6d4b\u8bd5\u5199\u64cd\u4f5c\u81ea\u52a8\u8d70\u4e3b\u5e93",id:"\u6d4b\u8bd5\u5199\u64cd\u4f5c\u81ea\u52a8\u8d70\u4e3b\u5e93",children:[],level:4},{value:"\u6d4b\u8bd5\u4e8b\u52a1\u65b9\u6cd5\u91cc\u7684\u6240\u6709\u8bfb\u5199\u64cd\u4f5c\u90fd\u81ea\u52a8\u8d70\u4e3b\u5e93",id:"\u6d4b\u8bd5\u4e8b\u52a1\u65b9\u6cd5\u91cc\u7684\u6240\u6709\u8bfb\u5199\u64cd\u4f5c\u90fd\u81ea\u52a8\u8d70\u4e3b\u5e93",children:[],level:4}],level:3}],level:2},{value:"\u672c\u6587\u76f8\u5173\u8303\u4f8b\u6e90\u7801",id:"\u672c\u6587\u76f8\u5173\u8303\u4f8b\u6e90\u7801",children:[],level:2},{value:"\u4e0b\u4e00\u6b65",id:"\u4e0b\u4e00\u6b65",children:[],level:2}],m={toc:c};function g(e){var t=e.components,d=(0,r.Z)(e,p);return(0,l.kt)("wrapper",(0,n.Z)({},m,d,{components:t,mdxType:"MDXLayout"}),(0,l.kt)("head",null,(0,l.kt)("title",null,"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6 | \u6570\u636e\u6cbb\u7406\u4e4b\u8bfb\u5199\u5206\u79bb | ShardingSphere-JDBC"),(0,l.kt)("meta",{name:"keywords",content:"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6 | \u6570\u636e\u6cbb\u7406\u4e4b\u8bfb\u5199\u5206\u79bb | ShardingSphere-JDBC"}),(0,l.kt)("meta",{name:"description",content:"\u300c\u76d8\u53e4\u5f00\u53d1\u6846\u67b6\u300d\u662f\u5b8c\u5168\u72ec\u7acb\u4e8e Spring Cloud \u751f\u6001\u7684\u4e00\u5957\u8f7b\u91cf\u7075\u6d3b\u3001\u6210\u719f\u53ef\u9760\u7684\u5de5\u4e1a\u7ea7\u5206\u5e03\u5f0f\u5fae\u670d\u52a1\u5f00\u53d1\u548c\u6cbb\u7406\u6846\u67b6\uff08\u517c\u5bb9\u5782\u76f4\u5355\u4f53\u5206\u5c42\u67b6\u6784)\u3002\u5b83\u57fa\u4e8e Apache-2.0 \u534f\u8bae\u5f00\u6e90\u53d1\u5e03\uff0c\u4e14\u662f\u514d\u8d39\u7684\u3002\u6211\u4eec\u5e0c\u671b\u4e0d\u4ec5\u662f\u5f00\u6e90\u7684\u53d7\u76ca\u8005\uff0c\u4e5f\u80fd\u6210\u4e3a\u5f00\u6e90\u7684\u8d21\u732e\u8005\uff0c\u4e0e\u5f00\u6e90\u793e\u533a\u4e00\u8d77\u300c\u5171\u5efa\u5171\u4eab\u5f00\u6e90\u751f\u6001\u300d\u3002"})),(0,l.kt)("p",null,"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6\u96c6\u6210\u4e86\u6570\u636e\u5e93\u4e2d\u95f4\u4ef6 ",(0,l.kt)("a",{parentName:"p",href:"https://shardingsphere.apache.org/index.html"},"ShardingSphere")," \u6765\u63d0\u4f9b\u6570\u636e\u6cbb\u7406\u76f8\u5173\u529f\u80fd\uff0c\u5982\uff1a\u8bfb\u5199\u5206\u79bb\u3001\u6570\u636e\u5206\u7247\u3001\u6570\u636e\u52a0\u5bc6\u7b49\u3002"),(0,l.kt)("h2",{id:"\u8bfb\u5199\u5206\u79bb\u6982\u5ff5"},"\u8bfb\u5199\u5206\u79bb\u6982\u5ff5"),(0,l.kt)("p",null,"\u968f\u7740\u4e1a\u52a1\u7cfb\u7edf\u65e5\u76ca\u589e\u52a0\u7684\u7cfb\u7edf\u8bbf\u95ee\u91cf\uff0c\u6570\u636e\u5e93\u7684\u541e\u5410\u91cf\u5f80\u5f80\u6210\u4e3a\u7cfb\u7edf\u5e76\u53d1\u7684\u6027\u80fd\u74f6\u9888\u3002\u5bf9\u4e8e\u540c\u4e00\u65f6\u523b\u6709\u5927\u91cf\u5e76\u53d1\u8bfb\u64cd\u4f5c\u548c\u8f83\u5c11\u5199\u64cd\u4f5c\u7c7b\u578b\u7684\u5e94\u7528\u7cfb\u7edf\u6765\u8bf4\uff0c\u5c06\u6570\u636e\u5e93\u62c6\u5206\u4e3a\u4e3b\u5e93\u548c\u4ece\u5e93\u642d\u67b6\u4e3b\u4ece\u96c6\u7fa4\uff0c\u7531\u4e3b\u5e93\u8d1f\u8d23\u5904\u7406\u4e8b\u52a1\u6027\u7684\u589e\u5220\u6539\u64cd\u4f5c\uff0c\u4ece\u5e93\u8d1f\u8d23\u5904\u7406\u67e5\u8be2\u64cd\u4f5c\uff0c\u80fd\u591f\u6709\u6548\u7684\u907f\u514d\u6570\u636e\u66f4\u65b0\u5bfc\u81f4\u7684\u884c\u9501\uff0c\u4ece\u800c\u4e00\u5b9a\u7a0b\u5ea6\u63d0\u5347\u6574\u4e2a\u7cfb\u7edf\u7684\u8bfb\u5199\u5e76\u53d1\u6027\u80fd\u3002\u5982\u4e0b\u56fe\u6240\u793a\u3002"),(0,l.kt)("img",{width:"400",src:a(9137).Z,alt:"\u865a\u62df\u4e1a\u52a1\u573a\u666f\u8bbe\u8ba1"}),(0,l.kt)("div",{className:"admonition admonition-tip alert alert--success"},(0,l.kt)("div",{parentName:"div",className:"admonition-heading"},(0,l.kt)("h5",{parentName:"div"},(0,l.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,l.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"12",height:"16",viewBox:"0 0 12 16"},(0,l.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M6.5 0C3.48 0 1 2.19 1 5c0 .92.55 2.25 1 3 1.34 2.25 1.78 2.78 2 4v1h5v-1c.22-1.22.66-1.75 2-4 .45-.75 1-2.08 1-3 0-2.81-2.48-5-5.5-5zm3.64 7.48c-.25.44-.47.8-.67 1.11-.86 1.41-1.25 2.06-1.45 3.23-.02.05-.02.11-.02.17H5c0-.06 0-.13-.02-.17-.2-1.17-.59-1.83-1.45-3.23-.2-.31-.42-.67-.67-1.11C2.44 6.78 2 5.65 2 5c0-2.2 2.02-4 4.5-4 1.22 0 2.36.42 3.22 1.19C10.55 2.94 11 3.94 11 5c0 .66-.44 1.78-.86 2.48zM4 14h5c-.23 1.14-1.3 2-2.5 2s-2.27-.86-2.5-2z"}))),"\u63d0\u793a")),(0,l.kt)("div",{parentName:"div",className:"admonition-content"},(0,l.kt)("p",{parentName:"div"},"\u76ee\u524d\u652f\u6301\u4e00\u4e3b\u4e00\u4ece\u6216\u4e00\u4e3b\u591a\u4ece\u7684\u4e3b\u4ece\u96c6\u7fa4\u67b6\u6784\uff0c\u4e0d\u652f\u6301\u591a\u4e3b\u5199\u7684\u67b6\u6784\u3002\u5bf9\u4e8e\u591a\u4ece\u7684\u67b6\u6784\u53ef\u6839\u636e\u8def\u7531\u7b97\u6cd5\u505a\u8bfb\u8d1f\u8f7d\u5747\u8861\uff0c\u4ee5\u5c06\u67e5\u8be2\u8bf7\u6c42\u5747\u5300\u7684\u5206\u6563\u5230\u591a\u4e2a\u6570\u636e\u526f\u672c\u3002\uff08\u6570\u636e\u5e93\u4e3b\u4ece\u67b6\u6784\u642d\u67b6\u4e0d\u5728\u672c\u6587\u8ba8\u8bba\u8303\u56f4\u4e4b\u5185\uff09"))),(0,l.kt)("h3",{id:"\u76f8\u5173\u4e13\u4e1a\u672f\u8bed"},"\u76f8\u5173\u4e13\u4e1a\u672f\u8bed"),(0,l.kt)("ul",null,(0,l.kt)("li",{parentName:"ul"},(0,l.kt)("strong",{parentName:"li"},"\u4e3b\u5e93"),"\uff1a\u6570\u636e DML \u5199\u64cd\u4f5c\uff08insert\u3001update\u3001delete\uff09\u4f7f\u7528\u7684\u6570\u636e\u5e93\u3002\u4ec5\u652f\u6301\u5355\u4e3b\u5e93\u3002"),(0,l.kt)("li",{parentName:"ul"},(0,l.kt)("strong",{parentName:"li"},"\u4ece\u5e93"),"\uff1a\u6570\u636e DQL \u8bfb\u64cd\u4f5c\uff08select\uff09\u4f7f\u7528\u7684\u6570\u636e\u5e93\u3002\u53ef\u652f\u6301\u591a\u4ece\u5e93\u3002"),(0,l.kt)("li",{parentName:"ul"},(0,l.kt)("strong",{parentName:"li"},"\u4e3b\u4ece\u540c\u6b65"),"\uff1a\u5c06\u4e3b\u5e93\u6570\u636e\u540c\u6b65\u5230\u4ece\u5e93\u7684\u64cd\u4f5c\u3002\u4f9d\u8d56\u6570\u636e\u5e93\u81ea\u8eab\u7684\u540c\u6b65\u673a\u5236\uff0c\u6bd4\u5982\uff1aMySQL \u57fa\u4e8e binlog \u7684\u5f02\u6b65\u590d\u5236\u3002")),(0,l.kt)("h3",{id:"\u8bfb\u5199\u5206\u79bb\u540e\u9762\u4e34\u7684\u95ee\u9898"},"\u8bfb\u5199\u5206\u79bb\u540e\u9762\u4e34\u7684\u95ee\u9898"),(0,l.kt)("p",null,"\u5bf9\u4e8e\u4e00\u822c\u7684\u7b80\u5355\u7406\u89e3\uff0c\u8bfb\u5199\u5206\u79bb\u5c31\u662f DQL \u8bf7\u6c42\u8d70\u4ece\u5e93\uff0cDML \u8bf7\u6c42\u8d70\u4e3b\u5e93\u3002\u4f46\u5bf9\u4e8e\u5f00\u53d1\u4eba\u5458\u800c\u8a00\uff0c\u5728\u5b9e\u9645\u5f00\u53d1\u4e2d\u8fd8\u9700\u8981\u8003\u8651\u5982\u4e0b\u95ee\u9898\u3002"),(0,l.kt)("ul",null,(0,l.kt)("li",{parentName:"ul"},(0,l.kt)("p",{parentName:"li"},(0,l.kt)("strong",{parentName:"p"},"\u4e3b\u4ece\u6570\u636e\u540c\u6b65\u5ef6\u8fdf\u95ee\u9898"),(0,l.kt)("br",{parentName:"p"}),"\n","\u56e0\u4e3a\u6211\u4eec\u4e3b\u4ece\u540c\u6b65\u662f\u5f02\u6b65\u590d\u5236\u7684\uff0c\u4e0d\u53ef\u907f\u514d\u7684\u4f1a\u6709\u5ef6\u8fdf\u3002\u56e0\u6b64\u6709\u53ef\u80fd\u51fa\u73b0 mastre \u8282\u70b9\u5df2\u7ecf\u5199\u5165\uff0c\u4f46\u662f\u4ece slave \u8282\u70b9\u8bfb\u53d6\u4e0d\u5230\u6570\u636e\u7684\u95ee\u9898\u3002\u89e3\u51b3\u65b9\u6cd5\u89c1\u540e\u7eed\u7ae0\u8282\uff1a",(0,l.kt)("a",{parentName:"p",href:"#%E8%AF%BB%E6%93%8D%E4%BD%9C%E5%BC%BA%E5%88%B6%E8%B5%B0%E4%B8%BB%E5%BA%93"},"\u8bfb\u64cd\u4f5c\u5f3a\u5236\u8d70\u4e3b\u5e93")," \u548c ",(0,l.kt)("a",{parentName:"p",href:"#%E4%BA%8B%E5%8A%A1%E6%96%B9%E6%B3%95%E9%87%8C%E7%9A%84%E6%89%80%E6%9C%89%E8%AF%BB%E5%86%99%E6%93%8D%E4%BD%9C%E9%83%BD%E8%87%AA%E5%8A%A8%E8%B5%B0%E4%B8%BB%E5%BA%93"},"\u4e8b\u52a1\u65b9\u6cd5\u91cc\u7684\u6240\u6709\u8bfb\u5199\u64cd\u4f5c\u90fd\u81ea\u52a8\u8d70\u4e3b\u5e93"),"\u3002")),(0,l.kt)("li",{parentName:"ul"},(0,l.kt)("p",{parentName:"li"},(0,l.kt)("strong",{parentName:"p"},"\u4e8b\u52a1\u95ee\u9898"),"\n\u5982\u679c\u4e00\u4e2a\u4e8b\u52a1\u65b9\u6cd5\u91cc\u65e2\u5305\u542b\u6709DML\u8bf7\u6c42\u4e5f\u6709DQL\u8bf7\u6c42\uff0c\u5982\u679c\u8bfb\u8bf7\u6c42\u8d70\u4ece\u5e93\u5199\u8bf7\u6c42\u8d70\u4e3b\u5e93\u7684\u8bdd\uff0c\u5219\u52bf\u5fc5\u4f1a\u5e26\u6765\u5206\u5e03\u5f0f\u4e8b\u52a1\u7684\u95ee\u9898\u3002\u4f46\u5bf9\u4e8e\u5927\u90e8\u5206\u8bfb\u5199\u5206\u79bb\u573a\u666f\u800c\u8a00\uff0c\u5f88\u663e\u7136\u6211\u4eec\u5e76\u4e0d\u5e0c\u671b\u4e3a\u4e86\u8bfb\u5199\u5206\u79bb\u800c\u53bb\u5904\u7406\u5206\u5e03\u5f0f\u4e8b\u52a1\u7684\u95ee\u9898\u3002\u56e0\u6b64\u5bf9\u4e8e\u8bfb\u5199\u5206\u79bb\uff0c\u6070\u5f53\u7684\u505a\u6cd5\u662f\u5c06\u4e8b\u52a1\u65b9\u6cd5\u4e2d\u7684\u6240\u6709 SQL \u8bf7\u6c42\u7edf\u4e00\u90fd\u8d70\u4e3b\u5e93\uff0c\u5c06\u8de8\u5e93\u7684\u5206\u5e03\u5f0f\u4e8b\u52a1\u8f6c\u4e3a\u672c\u5730\u4e8b\u52a1\u6765\u5904\u7406\u3002\u89c1\u540e\u7eed\u7ae0\u8282\uff1a",(0,l.kt)("a",{parentName:"p",href:"#%E4%BA%8B%E5%8A%A1%E6%96%B9%E6%B3%95%E9%87%8C%E7%9A%84%E6%89%80%E6%9C%89%E8%AF%BB%E5%86%99%E6%93%8D%E4%BD%9C%E9%83%BD%E8%87%AA%E5%8A%A8%E8%B5%B0%E4%B8%BB%E5%BA%93"},"\u4e8b\u52a1\u65b9\u6cd5\u91cc\u7684\u6240\u6709\u8bfb\u5199\u64cd\u4f5c\u90fd\u81ea\u52a8\u8d70\u4e3b\u5e93"),"\u3002\uff08\u5982\u679c\u5bf9\u4e8e\u5206\u5e03\u5f0f\u573a\u666f\u4e0b\u7684\u5206\u5e03\u5f0f\u4e8b\u52a1\u95ee\u9898\u7684\u5904\u7406\u611f\u5174\u8da3\uff0c\u53ef\u4ee5\u53c2\u8003\uff1a",(0,l.kt)("a",{parentName:"p",href:"/docs/advanced-guide/distributed-transaction"},"\u76d8\u53e4\u6846\u67b6\u5206\u5e03\u5f0f\u4e8b\u52a1\u6700\u4f73\u5b9e\u8df5"),"\uff09"))),(0,l.kt)("h2",{id:"\u8bfb\u5199\u5206\u79bb\u5b9e\u73b0\u539f\u7406"},"\u8bfb\u5199\u5206\u79bb\u5b9e\u73b0\u539f\u7406"),(0,l.kt)("p",null,"\u5b9e\u73b0\u8bfb\u5199\u5206\u79bb\u5927\u81f4\u6709 3 \u79cd\u65b9\u6848\u3002\u5982\u4e0b\u56fe\u6240\u793a\u3002"),(0,l.kt)("img",{width:"800",src:a(2143).Z,alt:"\u865a\u62df\u4e1a\u52a1\u573a\u666f\u8bbe\u8ba1"}),(0,l.kt)("ul",null,(0,l.kt)("li",{parentName:"ul"},(0,l.kt)("p",{parentName:"li"},(0,l.kt)("strong",{parentName:"p"},"\u6570\u636e\u5e93\u4ee3\u7406\u6a21\u5f0f\uff08\u670d\u52a1\u7aef\u4ee3\u7406\uff09"),(0,l.kt)("br",{parentName:"p"}),"\n","\u5728\u6570\u636e\u5e93\u548c\u5e94\u7528\u7cfb\u7edf\u4e4b\u95f4\u72ec\u7acb\u90e8\u7f72\u4e00\u4e2a\u6570\u636e\u5e93\u4ee3\u7406\u4e2d\u95f4\u4ef6\uff0c\u6240\u6709\u7684 SQL \u8bf7\u6c42\u5148\u53d1\u9001\u5230\u8fd9\u4e2a\u4ee3\u7406\uff0c\u7531\u5b83\u5b8c\u6210 SQL \u89e3\u6790\u3001SQL \u8def\u7531\u7b49\u5fc5\u8981\u64cd\u4f5c\u3002\u5728\u8fd9\u79cd\u6a21\u5f0f\u4e0b\uff0c\u8def\u7531\u89c4\u5219\u90fd\u914d\u7f6e\u5230\u4ee3\u7406\u4e0a\uff0c\u8bfb\u5199\u5206\u79bb\u7684\u903b\u8f91\u5bf9\u5f00\u53d1\u4eba\u5458\u662f\u900f\u660e\u7684\u3002")),(0,l.kt)("li",{parentName:"ul"},(0,l.kt)("p",{parentName:"li"},(0,l.kt)("strong",{parentName:"p"},"\u6570\u636e\u6e90\u4ee3\u7406\u6a21\u5f0f\uff08\u5ba2\u6237\u7aef\u4ee3\u7406\uff09"),(0,l.kt)("br",{parentName:"p"}),"\n","\u901a\u8fc7\u5728\u5e94\u7528\u7aef\u5f15\u5165\u7ec4\u4ef6\u5305\uff0c\u4ee3\u7406\u5e94\u7528\u666e\u901a\u6570\u636e\u6e90\u3002\u5728\u8fd9\u79cd\u6a21\u5f0f\u4e0b\uff0c\u8def\u7531\u89c4\u5219\u914d\u7f6e\u5230\u5e94\u7528\u4fa7\uff0c\u6240\u6709 SQL \u8bf7\u6c42\u90fd\u901a\u8fc7\u4ee3\u7406\u6570\u636e\u6e90\u5b8c\u6210 SQL \u89e3\u6790\u3001SQL \u8def\u7531\u7b49\u5fc5\u8981\u64cd\u4f5c\u3002")),(0,l.kt)("li",{parentName:"ul"},(0,l.kt)("p",{parentName:"li"},(0,l.kt)("del",{parentName:"p"},(0,l.kt)("strong",{parentName:"del"},"ORM \u6846\u67b6\u4ee3\u7406\u6a21\u5f0f\uff08\u5ba2\u6237\u7aef\u4ee3\u7406\uff09")),(0,l.kt)("br",{parentName:"p"}),"\n","\u901a\u8fc7 ORM \u6846\u67b6\uff08Hibernate\u3001Mybatis \u7b49\uff09\u7684\u63d2\u4ef6\u3001\u62e6\u622a\u5668\u673a\u5236\u5b9e\u73b0\u3002\u8fd9\u53ea\u80fd\u7b97\u662f\u7279\u5b9a\u73af\u5883\u4e0b\u7684\u4e00\u79cd\u5b9e\u73b0\u65b9\u6cd5\uff0c\u4e0d\u80fd\u4f5c\u4e3a\u4e00\u5957\u5b8c\u6574\u7684\u6807\u51c6\u5316\u89e3\u51b3\u65b9\u6848\u3002\u6545\u5728\u6b64\u4e0d\u505a\u66f4\u591a\u63cf\u8ff0\u3002"))),(0,l.kt)("h3",{id:"\u6280\u672f\u65b9\u6848\u6307\u6807\u5bf9\u6bd4"},"\u6280\u672f\u65b9\u6848\u6307\u6807\u5bf9\u6bd4"),(0,l.kt)("table",null,(0,l.kt)("thead",{parentName:"table"},(0,l.kt)("tr",{parentName:"thead"},(0,l.kt)("th",{parentName:"tr",align:null},(0,l.kt)("div",{style:{width:"120px"}},"\u6280\u672f\u65b9\u6848")),(0,l.kt)("th",{parentName:"tr",align:null},"\u53ef\u9009\u7ec4\u4ef6"),(0,l.kt)("th",{parentName:"tr",align:null},(0,l.kt)("div",{style:{width:"150px"}},"\u4f18\u70b9")),(0,l.kt)("th",{parentName:"tr",align:null},(0,l.kt)("div",{style:{width:"200px"}},"\u7f3a\u70b9")))),(0,l.kt)("tbody",{parentName:"table"},(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},(0,l.kt)("strong",{parentName:"td"},"\u6570\u636e\u5e93\u4ee3\u7406\u6a21\u5f0f")),(0,l.kt)("td",{parentName:"tr",align:null},"ShardingSphere-Proxy ",(0,l.kt)("br",null)," MyCat"),(0,l.kt)("td",{parentName:"tr",align:null},"\u591a\u8bed\u8a00\u652f\u6301",(0,l.kt)("br",null),"\u72ec\u7acb\u90e8\u7f72\uff08\u5347\u7ea7\u7b80\u5355\uff09",(0,l.kt)("br",null),"\u5bf9\u5f00\u53d1\u5b8c\u5168\u900f\u660e"),(0,l.kt)("td",{parentName:"tr",align:null},"\u72ec\u7acb\u90e8\u7f72\uff08\u589e\u52a0\u4e0d\u7a33\u5b9a\u56e0\u7d20\uff09",(0,l.kt)("br",null)," \u8fd0\u7ef4\u6210\u672c\u9ad8",(0,l.kt)("br",null),"\u6027\u80fd\u635f\u8017\u9ad8")),(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},(0,l.kt)("strong",{parentName:"td"},"\u6570\u636e\u6e90\u4ee3\u7406\u6a21\u5f0f \ud83d\udc8b ")),(0,l.kt)("td",{parentName:"tr",align:null},"ShardingSphere-JDBC"),(0,l.kt)("td",{parentName:"tr",align:null},"\u96c6\u6210\u7b80\u5355\u3001\u8f7b\u677e\u9a7e\u9a6d",(0,l.kt)("br",null),"\u6027\u80fd\u8f83\u597d"),(0,l.kt)("td",{parentName:"tr",align:null},"\u5d4c\u5165JAR\uff08\u5347\u7ea7\u9ebb\u70e6\uff09",(0,l.kt)("br",null),"\u65e5\u5e38\u6570\u636e\u7ef4\u62a4\u9ebb\u70e6")),(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},(0,l.kt)("strong",{parentName:"td"},(0,l.kt)("del",{parentName:"strong"},"ORM\u6846\u67b6\u4ee3\u7406\u6a21\u5f0f"))),(0,l.kt)("td",{parentName:"tr",align:null},"\u81ea\u7814/\u786c\u7f16\u7801"),(0,l.kt)("td",{parentName:"tr",align:null},"\u786c\u64b8\u4e00\u65f6\u723d"),(0,l.kt)("td",{parentName:"tr",align:null},"\u4e8b\u540e\u706b\u846c\u573a")))),(0,l.kt)("div",{className:"admonition admonition-caution alert alert--warning"},(0,l.kt)("div",{parentName:"div",className:"admonition-heading"},(0,l.kt)("h5",{parentName:"div"},(0,l.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,l.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"16",height:"16",viewBox:"0 0 16 16"},(0,l.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M8.893 1.5c-.183-.31-.52-.5-.887-.5s-.703.19-.886.5L.138 13.499a.98.98 0 0 0 0 1.001c.193.31.53.501.886.501h13.964c.367 0 .704-.19.877-.5a1.03 1.03 0 0 0 .01-1.002L8.893 1.5zm.133 11.497H6.987v-2.003h2.039v2.003zm0-3.004H6.987V5.987h2.039v4.006z"}))),"caution")),(0,l.kt)("div",{parentName:"div",className:"admonition-content"},(0,l.kt)("p",{parentName:"div"},"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6\u4f7f\u7528 ShardingSphere-JDBC \u7ec4\u4ef6\uff0c\u901a\u8fc7\u6570\u636e\u6e90\u4ee3\u7406\u7684\u65b9\u5f0f\u5b9e\u73b0\u8bfb\u5199\u5206\u79bb\u529f\u80fd\u3002"))),(0,l.kt)("h2",{id:"\u7f16\u7a0b\u5b9e\u6218"},"\u7f16\u7a0b\u5b9e\u6218"),(0,l.kt)("p",null,"\u672c\u5b9e\u4f8b\u4ee5\u4e00\u4e3b\u4e8c\u4ece\u7684\u6570\u636e\u5e93\u4e3b\u4ece\u96c6\u7fa4\u4e3a\u4f8b\uff0c\u6765\u6f14\u793a\u5982\u4f55\u57fa\u4e8e\u76d8\u53e4\u6846\u67b6\u5f00\u53d1\u4e00\u4e2a\u8bfb\u5199\u5206\u79bb\u4e14\u652f\u6301\u8bfb\u8d1f\u8f7d\u5747\u8861\u7684\u8303\u4f8b\u7a0b\u5e8f\u3002"),(0,l.kt)("h3",{id:"\u521d\u59cb\u5316\u6570\u636e\u5e93\u73af\u5883"},"\u521d\u59cb\u5316\u6570\u636e\u5e93\u73af\u5883"),(0,l.kt)("blockquote",null,(0,l.kt)("p",{parentName:"blockquote"},"\u57fa\u4e8e\u4e00\u4e2a\u7528\u6237\u4fe1\u606f\u8868\u6765\u6f14\u793a\u3002\u4e3a\u4e86\u65b9\u4fbf\u67e5\u770b\u6d4b\u8bd5\u6548\u679c\uff0c\u6211\u4eec\u5206\u522b\u628a\u4e09\u4e2a\u5e93\u4e2d\u7684\u7528\u6237\u59d3\u540d\u5b57\u6bb5\u7684\u503c\u6253\u4e0a\u4e0d\u540c\u7684\u6807\u8bb0\u3002")),(0,l.kt)(i.Z,{mdxType:"Tabs"},(0,l.kt)(s.Z,{value:"master",label:"\u4e3b\u5e93 DDL",mdxType:"TabItem"},(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"CREATE TABLE `user` (\n  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '\u6d41\u6c34\u53f7',\n  `name` varchar(255) NOT NULL COMMENT '\u59d3\u540d',\n  `birthday` date DEFAULT NULL COMMENT '\u751f\u65e5',\n  `age` int(11) DEFAULT NULL COMMENT '\u5e74\u9f84',\n  `user_type` varchar(255) DEFAULT NULL COMMENT '\u7528\u6237\u7c7b\u578b',\n  `gmt_create` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '\u521b\u5efa\u65f6\u95f4',\n  `gmt_update` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '\u66f4\u65b0\u65f6\u95f4',\n  PRIMARY KEY (`id`) USING BTREE\n) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COMMENT='\u7528\u6237\u4fe1\u606f\u8868';\nINSERT INTO `pangu-examples`.`user` (`id`, `name`, `birthday`, `age`, `user_type`) VALUES (1, 'XC\uff08master\uff09', NULL, 18, '1');\n"))),(0,l.kt)(s.Z,{value:"slave-0",label:"\u4ece\u5e931 DDL",mdxType:"TabItem"},(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"-- \u5efa\u8868\u811a\u672c\u540c\u4e3b\u5e93\nINSERT INTO `pangu-examples-0`.`user` (`id`, `name`, `birthday`, `age`, `user_type`) VALUES (1, 'XC\uff08slave-0\uff09', NULL, 18, '1');\n"))),(0,l.kt)(s.Z,{value:"account",label:"\u4ece\u5e932 DDL",mdxType:"TabItem"},(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"-- \u5efa\u8868\u811a\u672c\u540c\u4e3b\u5e93\nINSERT INTO `pangu-examples-1`.`user` (`id`, `name`, `birthday`, `age`, `user_type`) VALUES (1, 'XC\uff08slave-1\uff09', NULL, 18, '1');\n")))),(0,l.kt)("h3",{id:"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6a21\u5757"},"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6a21\u5757"),(0,l.kt)(i.Z,{defaultValue:"dependency3",mdxType:"Tabs"},(0,l.kt)(s.Z,{value:"parent",label:"\u76d8\u53e4Parent",mdxType:"TabItem"},(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"<parent>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-parent</artifactId>\n    <version>latest.version.xxx</version>\n    <relativePath/>\n</parent>\n"))),(0,l.kt)(s.Z,{value:"dependency1",label:"\u57fa\u7840\u6a21\u5757",mdxType:"TabItem"},(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-spring-boot-starter</artifactId>\n</dependency>\n"))),(0,l.kt)(s.Z,{value:"dependency2",label:"JDBC\u6a21\u5757",mdxType:"TabItem"},(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-jdbc-spring-boot-starter</artifactId>\n</dependency>\n"))),(0,l.kt)(s.Z,{value:"dependency3",label:"ShardingSphere\u6a21\u5757",mdxType:"TabItem"},(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-shardingsphere-spring-boot-starter</artifactId>\n</dependency>\n")))),(0,l.kt)("h3",{id:"\u672c\u5730\u914d\u7f6e"},"\u672c\u5730\u914d\u7f6e"),(0,l.kt)("blockquote",null,(0,l.kt)("p",{parentName:"blockquote"},"\u4e3a\u4fbf\u4e8e\u7406\u89e3\uff0c\u672c\u6587\u57fa\u4e8e\u672c\u5730\u914d\u7f6e\u7684\u65b9\u5f0f\u7f16\u5199\u3002\u82e5\u6539\u4e3a\u6807\u51c6\u7684Nacos\u914d\u7f6e\u4e2d\u5fc3\u6a21\u5f0f\uff0c\u8bf7\u53c2\u9605:",(0,l.kt)("a",{parentName:"p",href:"/docs/advanced-guide/nacos-config-center"},"\u914d\u7f6e\u4e2d\u5fc3"),"\u7ae0\u8282\u3002")),(0,l.kt)(i.Z,{mdxType:"Tabs"},(0,l.kt)(s.Z,{value:"application",label:"application.properties",mdxType:"TabItem"},(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"spring.profiles.active=${spring.profiles.active:dev}\n"))),(0,l.kt)(s.Z,{value:"application-dev",label:"application-dev.properties",mdxType:"TabItem"},(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"spring.application.name=pangu-examples-shardingsphere-readwrite-splitting\n\nmybatis-plus.mapperLocations=classpath*:/mapper/**/*.xml\nmybatis-plus.configuration.log-impl=org.apache.ibatis.logging.stdout.StdOutImpl\n\n\nspring.shardingsphere.datasource.names=ds-master,ds-slave-0,ds-slave-1\n\n# \u4e3b\u5e93\u6570\u636e\u6e90\u914d\u7f6e\nspring.shardingsphere.datasource.ds-master.type=com.zaxxer.hikari.HikariDataSource\nspring.shardingsphere.datasource.ds-master.driver-class-name=com.mysql.cj.jdbc.Driver\nspring.shardingsphere.datasource.ds-master.jdbc-url=jdbc:mysql://localhost:3306/pangu-examples\nspring.shardingsphere.datasource.ds-master.username=root\nspring.shardingsphere.datasource.ds-master.password=root123456\n\n# \u4ece\u5e931\u6570\u636e\u6e90\u914d\u7f6e\nspring.shardingsphere.datasource.ds-slave-0.type=com.zaxxer.hikari.HikariDataSource\nspring.shardingsphere.datasource.ds-slave-0.driver-class-name=com.mysql.cj.jdbc.Driver\nspring.shardingsphere.datasource.ds-slave-0.jdbc-url=jdbc:mysql://localhost:3306/pangu-examples-0\nspring.shardingsphere.datasource.ds-slave-0.username=root\nspring.shardingsphere.datasource.ds-slave-0.password=root123456\n\n# \u4ece\u5e932\u6570\u636e\u6e90\u914d\u7f6e\nspring.shardingsphere.datasource.ds-slave-1.type=com.zaxxer.hikari.HikariDataSource\nspring.shardingsphere.datasource.ds-slave-1.driver-class-name=com.mysql.cj.jdbc.Driver\nspring.shardingsphere.datasource.ds-slave-1.jdbc-url=jdbc:mysql://localhost:3306/pangu-examples-1\nspring.shardingsphere.datasource.ds-slave-1.username=root\nspring.shardingsphere.datasource.ds-slave-1.password=root123456\n\n# \u8bfb\u5199\u5206\u79bb\u7b56\u7565\u914d\u7f6e\nspring.shardingsphere.rules.readwrite-splitting.data-sources.pangu-rws.type=Static\n# \u5199\u6570\u636e\u6e90\u914d\u7f6e\nspring.shardingsphere.rules.readwrite-splitting.data-sources.pangu-rws.props.write-data-source-name=ds-master\n# \u8bfb\u6570\u636e\u6e90\u914d\u7f6e\nspring.shardingsphere.rules.readwrite-splitting.data-sources.pangu-rws.props.read-data-source-names=ds-slave-0,ds-slave-1\n# \u8bfb\u8d1f\u8f7d\u5747\u8861\u7b97\u6cd5\u914d\u7f6e\nspring.shardingsphere.rules.readwrite-splitting.load-balancers.read-random.type=RANDOM\n\n\nlogging.level.root=INFO\nlogging.level.com.gitee.pulanos.pangu=INFO\n")))),(0,l.kt)("h3",{id:"\u4e3b\u8981\u903b\u8f91\u4ee3\u7801"},"\u4e3b\u8981\u903b\u8f91\u4ee3\u7801"),(0,l.kt)("h4",{id:"\u8bfb\u64cd\u4f5c\u81ea\u52a8\u8d70\u4ece\u5e93\u8d1f\u8f7d\u5747\u8861"},"\u8bfb\u64cd\u4f5c\u81ea\u52a8\u8d70\u4ece\u5e93\u8d1f\u8f7d\u5747\u8861"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},'public void readRoute() {\n    log.info("\u67e5\u8be2\u6570\u636e...");\n    UserEntity userEntity = userMapper.selectById(1L);\n    log.info("\u67e5\u8be2\u7ed3\u679c {}", userEntity);\n}\n')),(0,l.kt)("h4",{id:"\u8bfb\u64cd\u4f5c\u5f3a\u5236\u8d70\u4e3b\u5e93"},"\u8bfb\u64cd\u4f5c\u5f3a\u5236\u8d70\u4e3b\u5e93"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},'public void readByWriteRoute() {\n    HintManager hintManager = HintManager.getInstance();\n    hintManager.setWriteRouteOnly();\n    try {\n        log.info("\u67e5\u8be2\u6570\u636e\uff08\u5f3a\u5236\u8d70\u4e3b\u5e93\uff09...");\n        UserEntity userEntity = userMapper.selectById(1L);\n        log.info("\u67e5\u8be2\u7ed3\u679c {}", userEntity);\n    } finally {\n        hintManager.close();\n    }\n}\n')),(0,l.kt)("h4",{id:"\u5199\u64cd\u4f5c\u81ea\u52a8\u8d70\u4e3b\u5e93"},"\u5199\u64cd\u4f5c\u81ea\u52a8\u8d70\u4e3b\u5e93"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},'public int writeRoute() {\n    log.info("\u63d2\u5165\u6570\u636e...");\n    UserEntity userEntity = new UserEntity();\n    userEntity.setName("XC").setAge(18).setUserType("1");\n    int row = userMapper.insert(userEntity);\n    log.info("\u6210\u529f\u63d2\u5165{}\u6761\u6570\u636e\u3002{}", row, userEntity);\n    return row;\n}\n')),(0,l.kt)("h4",{id:"\u4e8b\u52a1\u65b9\u6cd5\u91cc\u7684\u6240\u6709\u8bfb\u5199\u64cd\u4f5c\u90fd\u81ea\u52a8\u8d70\u4e3b\u5e93"},"\u4e8b\u52a1\u65b9\u6cd5\u91cc\u7684\u6240\u6709\u8bfb\u5199\u64cd\u4f5c\u90fd\u81ea\u52a8\u8d70\u4e3b\u5e93"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},'@Transactional(rollbackFor = RuntimeException.class)\npublic void doWithTransaction() {\n    log.info("\u63d2\u5165\u6570\u636e...");\n    UserEntity userEntity = new UserEntity();\n    userEntity.setName("XC").setAge(18).setUserType("1");\n    int row = userMapper.insert(userEntity);\n    log.info("\u6210\u529f\u63d2\u5165{}\u6761\u6570\u636e\u3002{}", row, userEntity);\n    log.info("\u67e5\u8be2\u6570\u636e\uff08\u5f3a\u5236\u8d70\u4e3b\u5e93\uff09...");\n    UserEntity userEntityRead = userMapper.selectById(1L);\n    log.info("\u67e5\u8be2\u7ed3\u679c {}", userEntityRead);\n}\n')),(0,l.kt)("h2",{id:"\u6d4b\u8bd5"},"\u6d4b\u8bd5"),(0,l.kt)("h3",{id:"\u542f\u52a8\u7c7b"},"\u542f\u52a8\u7c7b"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"@EnableTransactionManagement\n@SpringBootApplication\npublic class ReadWriteSplittingApplication {\n    public static void main(String[] args) {\n        PanGuApplicationBuilder.init(ReadWriteSplittingApplication.class).run(args);\n    }\n}\n")),(0,l.kt)("h3",{id:"\u6d4b\u8bd5\u7528\u4f8b"},"\u6d4b\u8bd5\u7528\u4f8b"),(0,l.kt)("h4",{id:"\u6d4b\u8bd5\u8bfb\u64cd\u4f5c\u81ea\u52a8\u8d70\u4ece\u5e93\u8d1f\u8f7d\u5747\u8861"},"\u6d4b\u8bd5\u8bfb\u64cd\u4f5c\u81ea\u52a8\u8d70\u4ece\u5e93\u8d1f\u8f7d\u5747\u8861"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"@Test\npublic void readRoute() {\n    readWriteSplittingService.readRoute();\n    readWriteSplittingService.readRoute();\n}\n")),(0,l.kt)("h4",{id:"\u6d4b\u8bd5\u8bfb\u64cd\u4f5c\u5f3a\u5236\u8d70\u4e3b\u5e93"},"\u6d4b\u8bd5\u8bfb\u64cd\u4f5c\u5f3a\u5236\u8d70\u4e3b\u5e93"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"@Test\npublic void readByWriteRoute() {\n    readWriteSplittingService.readByWriteRoute();\n}\n")),(0,l.kt)("h4",{id:"\u6d4b\u8bd5\u5199\u64cd\u4f5c\u81ea\u52a8\u8d70\u4e3b\u5e93"},"\u6d4b\u8bd5\u5199\u64cd\u4f5c\u81ea\u52a8\u8d70\u4e3b\u5e93"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"@Test\npublic void writeRoute() {\n    readWriteSplittingService.writeRoute();\n}\n")),(0,l.kt)("h4",{id:"\u6d4b\u8bd5\u4e8b\u52a1\u65b9\u6cd5\u91cc\u7684\u6240\u6709\u8bfb\u5199\u64cd\u4f5c\u90fd\u81ea\u52a8\u8d70\u4e3b\u5e93"},"\u6d4b\u8bd5\u4e8b\u52a1\u65b9\u6cd5\u91cc\u7684\u6240\u6709\u8bfb\u5199\u64cd\u4f5c\u90fd\u81ea\u52a8\u8d70\u4e3b\u5e93"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"@Test\npublic void doWithTransaction() {\n    readWriteSplittingService.doWithTransaction();\n}\n")),(0,l.kt)("h2",{id:"\u672c\u6587\u76f8\u5173\u8303\u4f8b\u6e90\u7801"},"\u672c\u6587\u76f8\u5173\u8303\u4f8b\u6e90\u7801"),(0,l.kt)("ul",null,(0,l.kt)("li",{parentName:"ul"},(0,l.kt)("a",{parentName:"li",href:"https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-shardingsphere-readwrite-splitting"},"pangu-examples-shardingsphere-readwrite-splitting"),"\uff1a\u6570\u636e\u6cbb\u7406\u4e4b\u8bfb\u5199\u5206\u79bb\u8303\u4f8b")),(0,l.kt)("h2",{id:"\u4e0b\u4e00\u6b65"},"\u4e0b\u4e00\u6b65"),(0,l.kt)("p",null,"\u7ee7\u7eed\u9605\u8bfb\u5176\u5b83\u7ae0\u8282\u83b7\u53d6\u4f60\u60f3\u8981\u7684\u7b54\u6848\u6216\u901a\u8fc7\u6211\u4eec\u7684 ",(0,l.kt)("a",{parentName:"p",href:"/docs/community"},"\u5f00\u53d1\u8005\u793e\u533a")," \u5bfb\u6c42\u66f4\u591a\u5e2e\u52a9\u3002"))}g.isMDXComponent=!0},2143:function(e,t,a){t.Z=a.p+"assets/images/27-pangu-framework-readwrite-splitting-895f2714eb8356719428797a474cfce6.png"},9137:function(e,t,a){t.Z=a.p+"assets/images/28-pangu-framework-readwrite-splitting-5350969993059c6d60c320e0a46bab20.png"}}]);