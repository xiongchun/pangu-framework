"use strict";(self.webpackChunkpangu_website=self.webpackChunkpangu_website||[]).push([[627],{3905:function(e,a,t){t.d(a,{Zo:function(){return p},kt:function(){return m}});var n=t(7294);function r(e,a,t){return a in e?Object.defineProperty(e,a,{value:t,enumerable:!0,configurable:!0,writable:!0}):e[a]=t,e}function l(e,a){var t=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);a&&(n=n.filter((function(a){return Object.getOwnPropertyDescriptor(e,a).enumerable}))),t.push.apply(t,n)}return t}function i(e){for(var a=1;a<arguments.length;a++){var t=null!=arguments[a]?arguments[a]:{};a%2?l(Object(t),!0).forEach((function(a){r(e,a,t[a])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(t)):l(Object(t)).forEach((function(a){Object.defineProperty(e,a,Object.getOwnPropertyDescriptor(t,a))}))}return e}function o(e,a){if(null==e)return{};var t,n,r=function(e,a){if(null==e)return{};var t,n,r={},l=Object.keys(e);for(n=0;n<l.length;n++)t=l[n],a.indexOf(t)>=0||(r[t]=e[t]);return r}(e,a);if(Object.getOwnPropertySymbols){var l=Object.getOwnPropertySymbols(e);for(n=0;n<l.length;n++)t=l[n],a.indexOf(t)>=0||Object.prototype.propertyIsEnumerable.call(e,t)&&(r[t]=e[t])}return r}var u=n.createContext({}),c=function(e){var a=n.useContext(u),t=a;return e&&(t="function"==typeof e?e(a):i(i({},a),e)),t},p=function(e){var a=c(e.components);return n.createElement(u.Provider,{value:a},e.children)},s={inlineCode:"code",wrapper:function(e){var a=e.children;return n.createElement(n.Fragment,{},a)}},d=n.forwardRef((function(e,a){var t=e.components,r=e.mdxType,l=e.originalType,u=e.parentName,p=o(e,["components","mdxType","originalType","parentName"]),d=c(t),m=r,g=d["".concat(u,".").concat(m)]||d[m]||s[m]||l;return t?n.createElement(g,i(i({ref:a},p),{},{components:t})):n.createElement(g,i({ref:a},p))}));function m(e,a){var t=arguments,r=a&&a.mdxType;if("string"==typeof e||r){var l=t.length,i=new Array(l);i[0]=d;var o={};for(var u in a)hasOwnProperty.call(a,u)&&(o[u]=a[u]);o.originalType=e,o.mdxType="string"==typeof e?e:r,i[1]=o;for(var c=2;c<l;c++)i[c]=t[c];return n.createElement.apply(null,i)}return n.createElement.apply(null,t)}d.displayName="MDXCreateElement"},8215:function(e,a,t){var n=t(7294);a.Z=function(e){var a=e.children,t=e.hidden,r=e.className;return n.createElement("div",{role:"tabpanel",hidden:t,className:r},a)}},6396:function(e,a,t){t.d(a,{Z:function(){return d}});var n=t(7462),r=t(7294),l=t(2389),i=t(9443);var o=function(){var e=(0,r.useContext)(i.Z);if(null==e)throw new Error('"useUserPreferencesContext" is used outside of "Layout" component.');return e},u=t(3616),c=t(6010),p="tabItem_vU9c";function s(e){var a,t,n,l=e.lazy,i=e.block,s=e.defaultValue,d=e.values,m=e.groupId,g=e.className,v=r.Children.map(e.children,(function(e){if((0,r.isValidElement)(e)&&void 0!==e.props.value)return e;throw new Error("Docusaurus error: Bad <Tabs> child <"+("string"==typeof e.type?e.type:e.type.name)+'>: all children of the <Tabs> component should be <TabItem>, and every <TabItem> should have a unique "value" prop.')})),k=null!=d?d:v.map((function(e){var a=e.props;return{value:a.value,label:a.label}})),f=(0,u.lx)(k,(function(e,a){return e.value===a.value}));if(f.length>0)throw new Error('Docusaurus error: Duplicate values "'+f.map((function(e){return e.value})).join(", ")+'" found in <Tabs>. Every value needs to be unique.');var h=null===s?s:null!=(a=null!=s?s:null==(t=v.find((function(e){return e.props.default})))?void 0:t.props.value)?a:null==(n=v[0])?void 0:n.props.value;if(null!==h&&!k.some((function(e){return e.value===h})))throw new Error('Docusaurus error: The <Tabs> has a defaultValue "'+h+'" but none of its children has the corresponding value. Available values are: '+k.map((function(e){return e.value})).join(", ")+". If you intend to show no default tab, use defaultValue={null} instead.");var b=o(),N=b.tabGroupChoices,y=b.setTabGroupChoices,w=(0,r.useState)(h),x=w[0],I=w[1],O=[],T=(0,u.o5)().blockElementScrollPositionUntilNextRender;if(null!=m){var D=N[m];null!=D&&D!==x&&k.some((function(e){return e.value===D}))&&I(D)}var E=function(e){var a=e.currentTarget,t=O.indexOf(a),n=k[t].value;n!==x&&(T(a),I(n),null!=m&&y(m,n))},j=function(e){var a,t=null;switch(e.key){case"ArrowRight":var n=O.indexOf(e.currentTarget)+1;t=O[n]||O[0];break;case"ArrowLeft":var r=O.indexOf(e.currentTarget)-1;t=O[r]||O[O.length-1]}null==(a=t)||a.focus()};return r.createElement("div",{className:"tabs-container"},r.createElement("ul",{role:"tablist","aria-orientation":"horizontal",className:(0,c.Z)("tabs",{"tabs--block":i},g)},k.map((function(e){var a=e.value,t=e.label;return r.createElement("li",{role:"tab",tabIndex:x===a?0:-1,"aria-selected":x===a,className:(0,c.Z)("tabs__item",p,{"tabs__item--active":x===a}),key:a,ref:function(e){return O.push(e)},onKeyDown:j,onFocus:E,onClick:E},null!=t?t:a)}))),l?(0,r.cloneElement)(v.filter((function(e){return e.props.value===x}))[0],{className:"margin-vert--md"}):r.createElement("div",{className:"margin-vert--md"},v.map((function(e,a){return(0,r.cloneElement)(e,{key:a,hidden:e.props.value!==x})}))))}function d(e){var a=(0,l.Z)();return r.createElement(s,(0,n.Z)({key:String(a)},e))}},9878:function(e,a,t){t.r(a),t.d(a,{frontMatter:function(){return c},contentTitle:function(){return p},metadata:function(){return s},toc:function(){return d},default:function(){return g}});var n=t(7462),r=t(3366),l=(t(7294),t(3905)),i=t(6396),o=t(8215),u=["components"],c={title:"\u914d\u7f6e\u4e2d\u5fc3",tags:["nacos","\u914d\u7f6e\u4e2d\u5fc3","\u76d8\u53e4\u7b80\u4ecb","\u76d8\u53e4\u67b6\u6784"],sidebar_position:1,slug:"/advanced-guide/nacos-config-center"},p=void 0,s={unversionedId:"advanced-guide/\u914d\u7f6e\u4e2d\u5fc3",id:"advanced-guide/\u914d\u7f6e\u4e2d\u5fc3",title:"\u914d\u7f6e\u4e2d\u5fc3",description:"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6 | \u914d\u7f6e\u4e2d\u5fc3 | \u57fa\u4e8e\u914d\u7f6e\u4e2d\u5fc3\u7684\u65e5\u5fd7\u7ea7\u522b\u70ed\u5207\u6362 | Nacos",source:"@site/docs/advanced-guide/\u914d\u7f6e\u4e2d\u5fc3.md",sourceDirName:"advanced-guide",slug:"/advanced-guide/nacos-config-center",permalink:"/pangu-framework/docs/advanced-guide/nacos-config-center",editUrl:"https://gitee.com/pulanos/pangu-framework/tree/master/pangu-website/docs/advanced-guide/\u914d\u7f6e\u4e2d\u5fc3.md",tags:[{label:"nacos",permalink:"/pangu-framework/docs/tags/nacos"},{label:"\u914d\u7f6e\u4e2d\u5fc3",permalink:"/pangu-framework/docs/tags/\u914d\u7f6e\u4e2d\u5fc3"},{label:"\u76d8\u53e4\u7b80\u4ecb",permalink:"/pangu-framework/docs/tags/\u76d8\u53e4\u7b80\u4ecb"},{label:"\u76d8\u53e4\u67b6\u6784",permalink:"/pangu-framework/docs/tags/\u76d8\u53e4\u67b6\u6784"}],version:"current",sidebarPosition:1,frontMatter:{title:"\u914d\u7f6e\u4e2d\u5fc3",tags:["nacos","\u914d\u7f6e\u4e2d\u5fc3","\u76d8\u53e4\u7b80\u4ecb","\u76d8\u53e4\u67b6\u6784"],sidebar_position:1,slug:"/advanced-guide/nacos-config-center"},sidebar:"tutorialSidebar",previous:{title:"\u5982\u4f55\u5f00\u53d1 HTTP \u63a5\u53e3",permalink:"/pangu-framework/docs/quick-start/how-to-create-http-api"},next:{title:"\u6ce8\u518c\u4e2d\u5fc3",permalink:"/pangu-framework/docs/advanced-guide/nacos-regist-center"}},d=[{value:"\u914d\u7f6e\u4e2d\u5fc3\u4ecb\u7ecd",id:"\u914d\u7f6e\u4e2d\u5fc3\u4ecb\u7ecd",children:[{value:"\u76f8\u5173\u540d\u8bcd\u89e3\u91ca",id:"\u76f8\u5173\u540d\u8bcd\u89e3\u91ca",children:[{value:"\u547d\u540d\u7a7a\u95f4",id:"\u547d\u540d\u7a7a\u95f4",children:[],level:4},{value:"\u914d\u7f6e\u7ba1\u7406",id:"\u914d\u7f6e\u7ba1\u7406",children:[],level:4},{value:"\u914d\u7f6e\u9879",id:"\u914d\u7f6e\u9879",children:[],level:4},{value:"\u914d\u7f6e\u96c6",id:"\u914d\u7f6e\u96c6",children:[],level:4},{value:"\u914d\u7f6e\u96c6ID",id:"\u914d\u7f6e\u96c6id",children:[],level:4},{value:"\u914d\u7f6e\u5feb\u7167",id:"\u914d\u7f6e\u5feb\u7167",children:[],level:4}],level:3},{value:"\u672c\u5730\u914d\u7f6e\u4e0e\u914d\u7f6e\u4e2d\u5fc3\u5bf9\u6bd4",id:"\u672c\u5730\u914d\u7f6e\u4e0e\u914d\u7f6e\u4e2d\u5fc3\u5bf9\u6bd4",children:[],level:3}],level:2},{value:"\u914d\u7f6e\u4e2d\u5fc3\u5b9e\u6218",id:"\u914d\u7f6e\u4e2d\u5fc3\u5b9e\u6218",children:[{value:"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6a21\u5757",id:"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6a21\u5757",children:[],level:3},{value:"\u672c\u5730\u914d\u7f6e",id:"\u672c\u5730\u914d\u7f6e",children:[{value:"\u5173\u952e\u914d\u7f6e\u9879\u8bf4\u660e",id:"\u5173\u952e\u914d\u7f6e\u9879\u8bf4\u660e",children:[],level:4}],level:3},{value:"\u914d\u7f6e\u4e2d\u5fc3\u914d\u7f6e",id:"\u914d\u7f6e\u4e2d\u5fc3\u914d\u7f6e",children:[{value:"\u521b\u5efa\u547d\u540d\u7a7a\u95f4",id:"\u521b\u5efa\u547d\u540d\u7a7a\u95f4",children:[],level:4},{value:"\u521b\u5efa\u914d\u7f6e\u96c6",id:"\u521b\u5efa\u914d\u7f6e\u96c6",children:[],level:4}],level:3},{value:"\u542f\u52a8\u5165\u53e3",id:"\u542f\u52a8\u5165\u53e3",children:[],level:3},{value:"\u4f7f\u7528\u914d\u7f6e",id:"\u4f7f\u7528\u914d\u7f6e",children:[],level:3}],level:2},{value:"\u5f69\u86cb\uff1a\u57fa\u4e8e\u914d\u7f6e\u4e2d\u5fc3\u7684\u65e5\u5fd7\u7ea7\u522b\u70ed\u5207\u6362",id:"\u5f69\u86cb\u57fa\u4e8e\u914d\u7f6e\u4e2d\u5fc3\u7684\u65e5\u5fd7\u7ea7\u522b\u70ed\u5207\u6362",children:[],level:2},{value:"\u672c\u6587\u76f8\u5173\u8303\u4f8b\u6e90\u7801",id:"\u672c\u6587\u76f8\u5173\u8303\u4f8b\u6e90\u7801",children:[],level:2},{value:"\u4e0b\u4e00\u6b65",id:"\u4e0b\u4e00\u6b65",children:[],level:2}],m={toc:d};function g(e){var a=e.components,c=(0,r.Z)(e,u);return(0,l.kt)("wrapper",(0,n.Z)({},m,c,{components:a,mdxType:"MDXLayout"}),(0,l.kt)("head",null,(0,l.kt)("title",null,"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6 | \u914d\u7f6e\u4e2d\u5fc3 | \u57fa\u4e8e\u914d\u7f6e\u4e2d\u5fc3\u7684\u65e5\u5fd7\u7ea7\u522b\u70ed\u5207\u6362 | Nacos"),(0,l.kt)("meta",{name:"keywords",content:"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6 | \u914d\u7f6e\u4e2d\u5fc3 | \u57fa\u4e8e\u914d\u7f6e\u4e2d\u5fc3\u7684\u65e5\u5fd7\u7ea7\u522b\u70ed\u5207\u6362 | Nacos"}),(0,l.kt)("meta",{name:"description",content:"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6\u662f\u4e00\u5957\u8f7b\u91cf\u7a33\u5065\u7684\u5de5\u4e1a\u7ea7\u5206\u5e03\u5f0f\u5fae\u670d\u52a1\u5f00\u53d1\u6cbb\u7406\u6846\u67b6\uff08\u517c\u5bb9\u5355\u4f53\u5206\u5c42\u67b6\u6784\uff09"})),(0,l.kt)("p",null,"\u914d\u7f6e\u4e2d\u5fc3\u4f5c\u4e3a\u5206\u5e03\u5f0f\u5fae\u670d\u52a1\u5f00\u53d1\u7684\u6807\u914d\u7ec4\u4ef6\uff0c\u4e1a\u754c\u5df2\u6709\u5f88\u591a\u6210\u529f\u7684\u5178\u578b\u5e94\u7528\uff0c\u5982\uff1a\u643a\u7a0b Apollo \u5206\u5e03\u5f0f\u914d\u7f6e\u4e2d\u5fc3\u3001\u767e\u5ea6 Disconf \u5206\u5e03\u5f0f\u914d\u7f6e\u4e2d\u5fc3\u7b49\u3002\u76d8\u53e4\u914d\u7f6e\u4e2d\u5fc3\u57fa\u4e8e\u963f\u91cc\u7684 ",(0,l.kt)("a",{parentName:"p",href:"/docs/thanks"},"Nacos")," \u63d0\u4f9b\u52a8\u6001\u914d\u7f6e\u670d\u52a1\u3002"),(0,l.kt)("div",{className:"admonition admonition-caution alert alert--warning"},(0,l.kt)("div",{parentName:"div",className:"admonition-heading"},(0,l.kt)("h5",{parentName:"div"},(0,l.kt)("span",{parentName:"h5",className:"admonition-icon"},(0,l.kt)("svg",{parentName:"span",xmlns:"http://www.w3.org/2000/svg",width:"16",height:"16",viewBox:"0 0 16 16"},(0,l.kt)("path",{parentName:"svg",fillRule:"evenodd",d:"M8.893 1.5c-.183-.31-.52-.5-.887-.5s-.703.19-.886.5L.138 13.499a.98.98 0 0 0 0 1.001c.193.31.53.501.886.501h13.964c.367 0 .704-.19.877-.5a1.03 1.03 0 0 0 .01-1.002L8.893 1.5zm.133 11.497H6.987v-2.003h2.039v2.003zm0-3.004H6.987V5.987h2.039v4.006z"}))),"caution")),(0,l.kt)("div",{parentName:"div",className:"admonition-content"},(0,l.kt)("p",{parentName:"div"},"\u9274\u4e8e\u6587\u6863\u53ef\u8bfb\u6027\uff0c\u76d8\u53e4\u6559\u7a0b\u548c\u53c2\u8003\u8303\u4f8b\u90fd\u4f7f\u7528\u7684\u672c\u5730\u914d\u7f6e\u7684\u65b9\u5f0f\u3002\u672c\u6587\u5c06\u4ecb\u7ecd\u5982\u4f55\u57fa\u4e8e\u914d\u7f6e\u4e2d\u5fc3\u8ba9\u76d8\u53e4\u5e94\u7528\u83b7\u5f97\u52a8\u6001\u914d\u7f6e\u670d\u52a1\u7684\u80fd\u529b\u3002\u5728\u5b9e\u9645\u5e94\u7528\u4e2d\uff0c\u5982\u65e0\u7279\u6b8a\u9700\u6c42\u6211\u4eec\u4e00\u822c\u90fd\u5efa\u8bae\u91c7\u7528\u914d\u7f6e\u4e2d\u5fc3\u7684\u65b9\u5f0f\u6765\u5f00\u53d1\u3002"))),(0,l.kt)("h2",{id:"\u914d\u7f6e\u4e2d\u5fc3\u4ecb\u7ecd"},"\u914d\u7f6e\u4e2d\u5fc3\u4ecb\u7ecd"),(0,l.kt)("p",null,"Nacos \u52a8\u6001\u914d\u7f6e\u670d\u52a1\u53ef\u4ee5\u8ba9\u4f60\u4ee5\u4e2d\u5fc3\u5316\u3001\u5916\u90e8\u5316\u548c\u52a8\u6001\u5316\u7684\u65b9\u5f0f\u7ba1\u7406\u6240\u6709\u73af\u5883\u7684\u5e94\u7528\u914d\u7f6e\u548c\u670d\u52a1\u914d\u7f6e\u3002\u52a8\u6001\u914d\u7f6e\u6d88\u9664\u4e86\u914d\u7f6e\u53d8\u66f4\u65f6\u91cd\u65b0\u90e8\u7f72\u5e94\u7528\u548c\u670d\u52a1\u7684\u9700\u8981\uff0c\u8ba9\u914d\u7f6e\u7ba1\u7406\u53d8\u5f97\u66f4\u52a0\u9ad8\u6548\u548c\u654f\u6377\u3002\u914d\u7f6e\u4e2d\u5fc3\u5316\u7ba1\u7406\u8ba9\u5b9e\u73b0\u65e0\u72b6\u6001\u670d\u52a1\u53d8\u5f97\u66f4\u7b80\u5355\uff0c\u8ba9\u670d\u52a1\u6309\u9700\u5f39\u6027\u6269\u5c55\u53d8\u5f97\u66f4\u5bb9\u6613\u3002\u5b83\u8fd8\u63d0\u4f9b\u4e86\u4e00\u4e2a\u7b80\u6d01\u6613\u7528\u7684 UI \u5e2e\u52a9\u4f60\u7ba1\u7406\u6240\u6709\u7684\u670d\u52a1\u548c\u5e94\u7528\u7684\u914d\u7f6e\uff0c\u5305\u62ec\u914d\u7f6e\u7248\u672c\u8ddf\u8e2a\u3001\u91d1\u4e1d\u96c0\u53d1\u5e03\u3001\u4e00\u952e\u56de\u6eda\u914d\u7f6e\u7b49\u4e00\u7cfb\u5217\u5f00\u7bb1\u5373\u7528\u7684\u914d\u7f6e\u7ba1\u7406\u7279\u6027\uff0c\u5e2e\u52a9\u4f60\u66f4\u5b89\u5168\u5730\u5728\u751f\u4ea7\u73af\u5883\u4e2d\u7ba1\u7406\u914d\u7f6e\u53d8\u66f4\u548c\u964d\u4f4e\u914d\u7f6e\u53d8\u66f4\u5e26\u6765\u7684\u98ce\u9669\u3002"),(0,l.kt)("details",null,(0,l.kt)("summary",null,(0,l.kt)("b",null,"\u5feb\u901f QA\uff1a"),"\u524d\u6587\u4e2d Nacos \u7528\u4e8e\u670d\u52a1\u6ce8\u518c\uff0c\u4e3a\u4ec0\u4e48\u914d\u7f6e\u4e2d\u5fc3\u4e5f\u662f\u5b83\uff1f"),(0,l.kt)("div",null,"Nacos \u662f\u6784\u5efa\u4ee5\u201c\u670d\u52a1\u201d\u4e3a\u4e2d\u5fc3\u7684\u73b0\u4ee3\u5e94\u7528\u67b6\u6784 (\u4f8b\u5982\u5fae\u670d\u52a1\u8303\u5f0f\u3001\u4e91\u539f\u751f\u8303\u5f0f) \u7684\u670d\u52a1\u57fa\u7840\u8bbe\u65bd\u3002\u81f4\u529b\u4e8e\u53d1\u73b0\u3001\u914d\u7f6e\u548c\u7ba1\u7406\u5fae\u670d\u52a1\uff0c\u5b8c\u7f8e\u7684\u6574\u5408\u4e86\u914d\u7f6e\u4e2d\u5fc3\u548c\u670d\u52a1\u6ce8\u518c\u4e2d\u5fc3\u3002\u56e0\u6b64\uff0cNacos \u4e0d\u4ec5\u662f\u670d\u52a1\u6ce8\u518c\u4e2d\u5fc3\u4e5f\u662f\u529f\u80fd\u5b8c\u5584\u7684\u5206\u5e03\u5f0f\u914d\u7f6e\u4e2d\u5fc3\u3002")),(0,l.kt)("details",null,(0,l.kt)("summary",null,(0,l.kt)("b",null,"\u5feb\u901f QA\uff1a"),"\u5355\u4f53\u5206\u5c42\u67b6\u6784\u7684\u5f00\u53d1\u6a21\u5f0f\u4e5f\u53ef\u4ee5\u4f7f\u7528\u914d\u7f6e\u4e2d\u5fc3\u8fdb\u884c\u914d\u7f6e\u5417\uff1f"),(0,l.kt)("div",null,"\u914d\u7f6e\u4e2d\u5fc3\u662f\u5206\u5e03\u5f0f\u5fae\u670d\u52a1\u67b6\u6784\u5f00\u53d1\u73af\u5883\u4e0b\u5f3a\u70c8\u5efa\u8bae\u7684\u5fc5\u9009\u6807\u914d\u7ec4\u4ef6\u3002\u4f46\u5982\u679c\u4f60\u662f\u57fa\u4e8e\u5355\u4f53\u5206\u5c42\u67b6\u6784\u5f00\u53d1\uff0c\u914d\u7f6e\u4e2d\u5fc3\u4e5f\u662f\u4e00\u6837\u53ef\u4ee5\u4f7f\u7528\u7684\u3002\u5bf9\u4e8e\u8fd9\u4e9b\u57fa\u7840\u80fd\u529b\uff0c\u65e0\u8bba\u662f\u5fae\u670d\u52a1\u8fd8\u662f\u5355\u4f53\uff0c\u76d8\u53e4\u6846\u67b6\u90fd\u505a\u4e86\u5b8c\u7f8e\u9002\u914d\uff0c\u53ea\u9700\u8981\u4f9d\u8d56 `pangu-spring-boot-starter` \u5c31\u53ef\u4ee5\u5b9e\u73b0\u5f00\u7bb1\u5373\u7528\u3002")),(0,l.kt)("h3",{id:"\u76f8\u5173\u540d\u8bcd\u89e3\u91ca"},"\u76f8\u5173\u540d\u8bcd\u89e3\u91ca"),(0,l.kt)("h4",{id:"\u547d\u540d\u7a7a\u95f4"},"\u547d\u540d\u7a7a\u95f4"),(0,l.kt)("p",null,"\u7528\u4e8e\u8fdb\u884c\u79df\u6237\u7c92\u5ea6\u7684\u914d\u7f6e\u9694\u79bb\u3002\u4e0d\u540c\u7684\u547d\u540d\u7a7a\u95f4\u4e0b\uff0c\u53ef\u4ee5\u5b58\u5728\u76f8\u540c\u7684 Group \u6216 Data ID \u7684\u914d\u7f6e\u3002Namespace \u7684\u5e38\u7528\u573a\u666f\u4e4b\u4e00\u662f\u4e0d\u540c\u73af\u5883\u7684\u914d\u7f6e\u7684\u533a\u5206\u9694\u79bb\uff0c\u4f8b\u5982\u5f00\u53d1\u6d4b\u8bd5\u73af\u5883\u548c\u751f\u4ea7\u73af\u5883\u7684\u8d44\u6e90\uff08\u5982\u914d\u7f6e\u3001\u670d\u52a1\uff09\u9694\u79bb\u7b49\u3002"),(0,l.kt)("h4",{id:"\u914d\u7f6e\u7ba1\u7406"},"\u914d\u7f6e\u7ba1\u7406"),(0,l.kt)("p",null,"\u7cfb\u7edf\u914d\u7f6e\u7684\u7f16\u8f91\u3001\u5b58\u50a8\u3001\u5206\u53d1\u3001\u53d8\u66f4\u7ba1\u7406\u3001\u5386\u53f2\u7248\u672c\u7ba1\u7406\u3001\u53d8\u66f4\u5ba1\u8ba1\u7b49\u6240\u6709\u4e0e\u914d\u7f6e\u76f8\u5173\u7684\u6d3b\u52a8\u3002"),(0,l.kt)("h4",{id:"\u914d\u7f6e\u9879"},"\u914d\u7f6e\u9879"),(0,l.kt)("p",null,"\u4e00\u4e2a\u5177\u4f53\u7684\u53ef\u914d\u7f6e\u7684\u53c2\u6570\u4e0e\u5176\u503c\u57df\uff0c\u901a\u5e38\u4ee5 param-key=param-value \u7684\u5f62\u5f0f\u5b58\u5728\u3002\u4f8b\u5982\u6211\u4eec\u5e38\u914d\u7f6e\u7cfb\u7edf\u7684\u65e5\u5fd7\u8f93\u51fa\u7ea7\u522b\uff08 logLevel=INFO|WARN|ERROR \uff09\u5c31\u662f\u4e00\u4e2a\u914d\u7f6e\u9879\u3002"),(0,l.kt)("h4",{id:"\u914d\u7f6e\u96c6"},"\u914d\u7f6e\u96c6"),(0,l.kt)("p",null,"\u4e00\u7ec4\u76f8\u5173\u6216\u8005\u4e0d\u76f8\u5173\u7684\u914d\u7f6e\u9879\u7684\u96c6\u5408\u79f0\u4e3a\u914d\u7f6e\u96c6\u3002\u5728\u7cfb\u7edf\u4e2d\uff0c\u4e00\u4e2a\u914d\u7f6e\u6587\u4ef6\u901a\u5e38\u5c31\u662f\u4e00\u4e2a\u914d\u7f6e\u96c6\uff0c\u5305\u542b\u4e86\u7cfb\u7edf\u5404\u4e2a\u65b9\u9762\u7684\u914d\u7f6e\u3002\u4f8b\u5982\uff0c\u4e00\u4e2a\u914d\u7f6e\u96c6\u53ef\u80fd\u5305\u542b\u4e86\u6570\u636e\u6e90\u3001\u7ebf\u7a0b\u6c60\u3001\u65e5\u5fd7\u7ea7\u522b\u7b49\u914d\u7f6e\u9879\u3002"),(0,l.kt)("h4",{id:"\u914d\u7f6e\u96c6id"},"\u914d\u7f6e\u96c6ID"),(0,l.kt)("p",null,"Nacos \u4e2d\u7684\u67d0\u4e2a\u914d\u7f6e\u96c6\u7684 ID\u3002\u914d\u7f6e\u96c6 ID \u662f\u7ec4\u7ec7\u5212\u5206\u914d\u7f6e\u7684\u7ef4\u5ea6\u4e4b\u4e00\u3002\u4e00\u4e2a\u7cfb\u7edf\u6216\u8005\u5e94\u7528\u53ef\u4ee5\u5305\u542b\u591a\u4e2a\u914d\u7f6e\u96c6\uff0c\u6bcf\u4e2a\u914d\u7f6e\u96c6\u90fd\u53ef\u4ee5\u88ab\u4e00\u4e2a\u6709\u610f\u4e49\u7684\u540d\u79f0\u6807\u8bc6\u3002\uff08\u6bd4\u5982\uff1a\u4f7f\u7528\u5e94\u7528\u540d\u79f0\u4f5c\u4e3a Data ID\uff09"),(0,l.kt)("h4",{id:"\u914d\u7f6e\u5feb\u7167"},"\u914d\u7f6e\u5feb\u7167"),(0,l.kt)("p",null,"Nacos \u7684\u5ba2\u6237\u7aef SDK \u4f1a\u5728\u672c\u5730\u751f\u6210\u914d\u7f6e\u7684\u5feb\u7167\u3002\u5f53\u5ba2\u6237\u7aef\u65e0\u6cd5\u8fde\u63a5\u5230 Nacos Server \u65f6\uff0c\u53ef\u4ee5\u4f7f\u7528\u914d\u7f6e\u5feb\u7167\u663e\u793a\u7cfb\u7edf\u7684\u6574\u4f53\u5bb9\u707e\u80fd\u529b\u3002\u914d\u7f6e\u5feb\u7167\u7c7b\u4f3c\u4e8e Git \u4e2d\u7684\u672c\u5730 commit\uff0c\u4e5f\u7c7b\u4f3c\u4e8e\u7f13\u5b58\uff0c\u4f1a\u5728\u9002\u5f53\u7684\u65f6\u673a\u66f4\u65b0\uff0c\u4f46\u662f\u5e76\u6ca1\u6709\u7f13\u5b58\u8fc7\u671f\uff08 expiration \uff09\u7684\u6982\u5ff5\u3002"),(0,l.kt)("h3",{id:"\u672c\u5730\u914d\u7f6e\u4e0e\u914d\u7f6e\u4e2d\u5fc3\u5bf9\u6bd4"},"\u672c\u5730\u914d\u7f6e\u4e0e\u914d\u7f6e\u4e2d\u5fc3\u5bf9\u6bd4"),(0,l.kt)("table",null,(0,l.kt)("thead",{parentName:"table"},(0,l.kt)("tr",{parentName:"thead"},(0,l.kt)("th",{parentName:"tr",align:null},"\u672c\u5730\u914d\u7f6e\uff08\u914d\u7f6e\u6587\u4ef6\uff09"),(0,l.kt)("th",{parentName:"tr",align:null},"\u914d\u7f6e\u4e2d\u5fc3"))),(0,l.kt)("tbody",{parentName:"table"},(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"\u914d\u7f6e\u5206\u6563\u3001\u4e0e\u5e94\u7528\u8026\u5408\u3001\u9759\u6001\u914d\u7f6e"),(0,l.kt)("td",{parentName:"tr",align:null},"\u914d\u7f6e\u96c6\u4e2d\u3001\u5916\u90e8\u5316\u3001\u52a8\u6001\u5316\u5b9e\u65f6\u751f\u6548")),(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"\u65e0\u73af\u5883\u9694\u79bb\u65e0\u7248\u672c\u652f\u6301\uff0c\u5bb9\u6613\u5f15\u53d1\u751f\u4ea7\u4e8b\u6545"),(0,l.kt)("td",{parentName:"tr",align:null},"\u591a\u73af\u5883\u9694\u79bb\u591a\u7248\u672c\u652f\u6301\uff0c\u8f83\u5b89\u5168")),(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"\u65e0\u5b89\u5168\u5ba1\u8ba1"),(0,l.kt)("td",{parentName:"tr",align:null},"\u914d\u7f6e\u6743\u9650\u63a7\u5236\u3001\u64cd\u4f5c\u53d8\u66f4\u5ba1\u8ba1")))),(0,l.kt)("h2",{id:"\u914d\u7f6e\u4e2d\u5fc3\u5b9e\u6218"},"\u914d\u7f6e\u4e2d\u5fc3\u5b9e\u6218"),(0,l.kt)("p",null,"\u4e0b\u9762\u4ecb\u7ecd\u4e00\u4e2a\u4f7f\u7528\u914d\u7f6e\u4e2d\u5fc3\u7684\u4f8b\u5b50\u3002\u5176\u5b83\u57fa\u4e8e\u672c\u5730\u914d\u7f6e\u7684\u8303\u4f8b\u90fd\u53ef\u4ee5\u53c2\u8003\u8fd9\u4e2a\u4f8b\u5b50\u6539\u4e3a\u57fa\u4e8e\u914d\u7f6e\u4e2d\u5fc3\u7684\u52a8\u6001\u914d\u7f6e\u3002"),(0,l.kt)("h3",{id:"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6a21\u5757"},"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6a21\u5757"),(0,l.kt)(i.Z,{mdxType:"Tabs"},(0,l.kt)(o.Z,{value:"parent",label:"\u76d8\u53e4 Parent",mdxType:"TabItem"},(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"<parent>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-parent</artifactId>\n    <version>latest.version.xxx</version>\n    <relativePath/>\n</parent>\n"))),(0,l.kt)(o.Z,{value:"dependency1",label:"\u57fa\u7840\u6a21\u5757",mdxType:"TabItem"},(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-spring-boot-starter</artifactId>\n</dependency>\n")))),(0,l.kt)("h3",{id:"\u672c\u5730\u914d\u7f6e"},"\u672c\u5730\u914d\u7f6e"),(0,l.kt)("p",null,"\u57fa\u4e8e\u914d\u7f6e\u4e2d\u5fc3\u7684\u914d\u7f6e\u4e5f\u662f\u9700\u8981\u4e00\u4e2a\u672c\u5730\u914d\u7f6e\u6587\u4ef6\u7684\uff0c\u4f46\u8fd9\u4e2a\u914d\u7f6e\u6587\u4ef6\u662f\u56fa\u5b9a\u7684\u6a21\u7248\u683c\u5f0f\u3002\u7528\u4e8e\u914d\u7f6e\u4e00\u4e9b\u4e0e\u914d\u7f6e\u4e2d\u5fc3\u8fdb\u884c\u6570\u636e\u901a\u4fe1\u76f8\u5173\u7684\u57fa\u7840\u7c7b\u53c2\u6570\u3002\u5982\u4e0b\u6240\u793a\u3002"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"spring.application.name=pangu-examples-config-remote-nacos\nspring.profiles.active=${spring.profiles.active:dev}\nnacos.config.bootstrap.enable=true\nnacos.config.bootstrap.log-enable=true\nnacos.config.auto-refresh=true\nnacos.config.namespace=${nacos.namespace:pangu-dev}\nnacos.config.server-addr=${nacos.server-addr:127.0.0.1:8848}\n#nacos.config.type=yaml\nnacos.config.type=properties\nnacos.config.data-id=${spring.application.name}\n")),(0,l.kt)("h4",{id:"\u5173\u952e\u914d\u7f6e\u9879\u8bf4\u660e"},"\u5173\u952e\u914d\u7f6e\u9879\u8bf4\u660e"),(0,l.kt)("table",null,(0,l.kt)("thead",{parentName:"table"},(0,l.kt)("tr",{parentName:"thead"},(0,l.kt)("th",{parentName:"tr",align:null},"\u914d\u7f6e\u9879"),(0,l.kt)("th",{parentName:"tr",align:null},"\u914d\u7f6e\u8bf4\u660e"))),(0,l.kt)("tbody",{parentName:"table"},(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"nacos.config.auto-refresh"),(0,l.kt)("td",{parentName:"tr",align:null},"\u914d\u7f6e\u4e2d\u5fc3\u7684\u914d\u7f6e\u53d8\u66f4\u540e\u81ea\u52a8\u5237\u65b0\u5230\u914d\u7f6e\u5ba2\u6237\u7aef")),(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"nacos.config.namespace"),(0,l.kt)("td",{parentName:"tr",align:null},"\u547d\u540d\u7a7a\u95f4\uff08\u6ce8\u610f\u662f\u5bf9\u5e94\u547d\u540d\u7a7a\u95f4\u7684 ID \u503c\uff09\uff0c\u5efa\u8bae\u4f7f\u7528\u547d\u540d\u7a7a\u95f4\u6765\u533a\u5206\u90e8\u7f72\u73af\u5883")),(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"nacos.config.server-addr"),(0,l.kt)("td",{parentName:"tr",align:null},"\u914d\u7f6e\u4e2d\u5fc3\u901a\u4fe1\u5730\u5740")),(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"nacos.config.type"),(0,l.kt)("td",{parentName:"tr",align:null},"\u914d\u7f6e\u4e2d\u5fc3\u4f7f\u7528\u7684\u914d\u7f6e\u683c\u5f0f\uff08 properties\u3001yaml \u7b49\uff09")),(0,l.kt)("tr",{parentName:"tbody"},(0,l.kt)("td",{parentName:"tr",align:null},"nacos.config.data-id"),(0,l.kt)("td",{parentName:"tr",align:null},"\u914d\u7f6e\u4e2d\u5fc3\u67d0\u914d\u7f6e\u96c6\u7684\u552f\u4e00\u6807\u8bc6")))),(0,l.kt)("h3",{id:"\u914d\u7f6e\u4e2d\u5fc3\u914d\u7f6e"},"\u914d\u7f6e\u4e2d\u5fc3\u914d\u7f6e"),(0,l.kt)("p",null,"\u5728\u8fdb\u884c\u5b8c\u4e0a\u8ff0\u672c\u5730\u914d\u7f6e\u540e\uff0c\u6211\u4eec\u7684\u5e94\u7528\u5c31\u80fd\u548c\u914d\u7f6e\u4e2d\u5fc3\u8fdb\u884c\u6570\u636e\u540c\u6b65\u4e86\u3002\u73b0\u5728\u6839\u636e\u672c\u5730\u914d\u7f6e\u4fe1\u606f\u5728\u914d\u7f6e\u4e2d\u5fc3\u521b\u5efa\u76f8\u5bf9\u5e94\u7684\u547d\u540d\u7a7a\u95f4\u548c\u540c\u540d data-id \u7684\u914d\u7f6e\u96c6\u3002"),(0,l.kt)("details",null,(0,l.kt)("summary",null,(0,l.kt)("b",null,"\u5feb\u901f QA\uff1a"),"\u5ba2\u6237\u7aef\u662f\u5982\u4f55\u4e0e Nacos \u914d\u7f6e\u4e2d\u5fc3\u8fdb\u884c\u6570\u636e\u540c\u6b65\u7684\uff1f"),(0,l.kt)("div",null,"\u5ba2\u6237\u7aef\u901a\u8fc7 http \u957f\u8f6e\u8be2\u673a\u5236\u62c9\u53d6 nacos server \u7aef\u7684\u914d\u7f6e\u6570\u636e\uff0c\u5e76\u4f1a\u5728\u672c\u5730\u521b\u5efa\u914d\u7f6e\u5feb\u7167\uff08\u5bb9\u707e\uff09\u3002\u5728\u957f\u8f6e\u8be2\u7684\u8d85\u65f6\u7b49\u5f85\u8fc7\u7a0b\u4e2d\uff0cnacos server \u7aef\u5982\u679c\u914d\u7f6e\u53d1\u751f\u6539\u53d8\uff0c\u4f1a\u4e3b\u52a8\u5c06\u914d\u7f6e\u5199\u5165 response \u5e76\u8fd4\u56de\uff0c\u6a21\u62df\u4e86\u201c\u63a8\u9001\u201d\u6548\u679c\u3002\u6240\u4ee5\u5ba2\u6237\u7aef\u80fd\u5b9e\u65f6\u611f\u77e5\u914d\u7f6e\u4e2d\u5fc3\u7684\u914d\u7f6e\u53d8\u5316\u3002")),(0,l.kt)("h4",{id:"\u521b\u5efa\u547d\u540d\u7a7a\u95f4"},"\u521b\u5efa\u547d\u540d\u7a7a\u95f4"),(0,l.kt)("p",null,"\u5728 Nacos \u7ba1\u7406\u7cfb\u7edf\u7684\u300e\u547d\u540d\u7a7a\u95f4\u300f\u83dc\u5355\u65b0\u5efa ID \u4e3a ",(0,l.kt)("inlineCode",{parentName:"p"},"pangu-dev")," \u7684\u547d\u540d\u7a7a\u95f4\uff08\u6b64 ID \u5373\u4e3a\u4e0a\u8ff0\u914d\u7f6e\u9879 nacos.config.namespace \u7684\u503c\uff09\u3002\u5982\u4e0b\u56fe\u6240\u793a\u3002"),(0,l.kt)("p",null,(0,l.kt)("img",{alt:"\u521b\u5efa\u547d\u540d\u7a7a\u95f4",src:t(7603).Z})),(0,l.kt)("h4",{id:"\u521b\u5efa\u914d\u7f6e\u96c6"},"\u521b\u5efa\u914d\u7f6e\u96c6"),(0,l.kt)("p",null,"\u4e00\u4e2a\u547d\u540d\u7a7a\u95f4\u4e0b\u53ef\u4ee5\u521b\u5efa\u591a\u7ec4\u914d\u7f6e\u96c6\uff0c\u6bcf\u4e2a\u914d\u7f6e\u96c6\u7531 data-id \u6765\u552f\u4e00\u6807\u8bc6\u3002\u5728 Nacos \u7ba1\u7406\u7cfb\u7edf\u7684\u300e\u914d\u7f6e\u7ba1\u7406-\u914d\u7f6e\u5217\u8868\u300f\u83dc\u5355\u65b0\u5efa data-id \u503c\u4e3a ",(0,l.kt)("inlineCode",{parentName:"p"},"pangu-examples-config-remote-nacos")," \u7684\u914d\u7f6e\u96c6\u3002\u5982\u4e0b\u56fe\u6240\u793a\u3002"),(0,l.kt)(i.Z,{mdxType:"Tabs"},(0,l.kt)(o.Z,{value:"img1",label:"\u914d\u7f6e\u96c6\u5217\u8868",mdxType:"TabItem"},(0,l.kt)("p",null,(0,l.kt)("img",{alt:"\u521b\u5efa\u914d\u7f6e\u96c6",src:t(9234).Z}))),(0,l.kt)(o.Z,{value:"img2",label:"\u65b0\u589e/\u7f16\u8f91\u914d\u7f6e\u96c6",mdxType:"TabItem"},(0,l.kt)("p",null,(0,l.kt)("img",{alt:"\u521b\u5efa\u914d\u7f6e\u96c6",src:t(9915).Z})))),(0,l.kt)("h3",{id:"\u542f\u52a8\u5165\u53e3"},"\u542f\u52a8\u5165\u53e3"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx",metastring:"{4}","{4}":!0},"@SpringBootApplication\npublic class NacosConfigurationApplication {\n    public static void main(String[] args) {\n        PanGuApplicationBuilder.init(NacosConfigurationApplication.class).run(args);\n    }\n}\n")),(0,l.kt)("h3",{id:"\u4f7f\u7528\u914d\u7f6e"},"\u4f7f\u7528\u914d\u7f6e"),(0,l.kt)("p",null,"\u81f3\u6b64\uff0c\u6211\u4eec\u5c31\u53ef\u4ee5\u5728\u5e94\u7528\u4e2d\u4f7f\u7528 ",(0,l.kt)("inlineCode",{parentName:"p"},"@NacosValue")," \u6ce8\u89e3\u6765\u83b7\u53d6\u914d\u7f6e\u9879\u4e86\u3002\u5982\u4e0b\u4ee3\u7801\u6240\u793a\u3002"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},'/**\n * \u5f00\u542f autoRefreshed\u914d\u7f6e\u9879, \u53ef\u4ee5\u5b9e\u73b0\u53c2\u6570\u7684\u52a8\u6001\u5237\u65b0\n */\n@NacosValue(value = "${demo.app.id}")\nprivate String appId;\n@NacosValue(value = "${demo.app.name}", autoRefreshed = true)\nprivate String appName;\n@NacosValue(value = "${demo.app.author}", autoRefreshed = true)\nprivate String appAuthor;\n')),(0,l.kt)("details",null,(0,l.kt)("summary",null,(0,l.kt)("b",null,"\u5feb\u901f QA\uff1a"),"\u8303\u4f8b\u53ea\u6f14\u793a\u4e86\u51e0\u4e2a\u7b80\u5355\u7684\u53d8\u91cf\u53c2\u6570\uff0c\u6570\u636e\u5e93\u7b49\u4e2d\u95f4\u4ef6\u7684\u8fde\u63a5\u914d\u7f6e\u4fe1\u606f\u53ef\u4ee5\u653e\u914d\u7f6e\u4e2d\u5fc3\u5417\uff1f"),(0,l.kt)("div",null,"\u5f53\u7136\u662f\u53ef\u4ee5\u7684\uff0c\u5e72\u5c31\u5b8c\u4e86\u3002")),(0,l.kt)("h2",{id:"\u5f69\u86cb\u57fa\u4e8e\u914d\u7f6e\u4e2d\u5fc3\u7684\u65e5\u5fd7\u7ea7\u522b\u70ed\u5207\u6362"},"\u5f69\u86cb\uff1a\u57fa\u4e8e\u914d\u7f6e\u4e2d\u5fc3\u7684\u65e5\u5fd7\u7ea7\u522b\u70ed\u5207\u6362"),(0,l.kt)("p",null,"\u4e3a\u4e86\u589e\u5f3a\u65e5\u5fd7\u8f93\u51fa\u7684\u53ef\u89c2\u6d4b\u6027\uff0c\u76d8\u53e4\u57fa\u7840\u6a21\u5757\u5b9e\u73b0\u4e86\u57fa\u4e8e\u914d\u7f6e\u4e2d\u5fc3\u7684\u65e5\u5fd7\u7ea7\u522b\u70ed\u5207\u6362\u80fd\u529b\u3002\u53ea\u9700\u8981\u5728\u914d\u7f6e\u4e2d\u5fc3\u4fee\u6539\u6216\u65b0\u589e\u65e5\u5fd7\u7ea7\u522b\u914d\u7f6e\uff0c\u5219\u5bf9\u5e94\u7684\u65e5\u5fd7\u8f93\u51fa\u7ea7\u522b\u5373\u523b\u5b9e\u65f6\u751f\u6548\u3002"),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-jsx"},"#\u65e5\u5fd7\nlogging.level.root=INFO\nlogging.level.com.gitee.pulanos.pangu=INFO\n")),(0,l.kt)("h2",{id:"\u672c\u6587\u76f8\u5173\u8303\u4f8b\u6e90\u7801"},"\u672c\u6587\u76f8\u5173\u8303\u4f8b\u6e90\u7801"),(0,l.kt)("ul",null,(0,l.kt)("li",{parentName:"ul"},(0,l.kt)("a",{parentName:"li",href:"https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-config-remote-nacos"},"pangu-examples-config-remote-nacos"),"\uff1a\u914d\u7f6e\u4e2d\u5fc3\u53c2\u8003\u8303\u4f8b"),(0,l.kt)("li",{parentName:"ul"},(0,l.kt)("a",{parentName:"li",href:"https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-log-dynamic"},"pangu-examples-log-dynamic"),"\uff1a\u57fa\u4e8e\u914d\u7f6e\u4e2d\u5fc3\u7684\u65e5\u5fd7\u7ea7\u522b\u70ed\u5207\u6362\u53c2\u8003\u8303\u4f8b")),(0,l.kt)("h2",{id:"\u4e0b\u4e00\u6b65"},"\u4e0b\u4e00\u6b65"),(0,l.kt)("p",null,"\u7ee7\u7eed\u9605\u8bfb\u5176\u5b83\u7ae0\u8282\u83b7\u53d6\u4f60\u60f3\u8981\u7684\u7b54\u6848\u6216\u901a\u8fc7\u6211\u4eec\u7684 ",(0,l.kt)("a",{parentName:"p",href:"/docs/community"},"\u5f00\u53d1\u8005\u793e\u533a")," \u5bfb\u6c42\u66f4\u591a\u5e2e\u52a9\u3002"))}g.isMDXComponent=!0},7603:function(e,a,t){a.Z=t.p+"assets/images/5-pangu-framework-nacos-fe8c6993888d62ca44a92af4f8cb1a53.png"},9234:function(e,a,t){a.Z=t.p+"assets/images/6-pangu-framework-nacos-0a9156bbb5b3f7d49c4c50c5e0fb61a5.png"},9915:function(e,a,t){a.Z=t.p+"assets/images/7-pangu-framework-nacos-31a90858740c790cd14ec9e0b9a676a2.png"}}]);