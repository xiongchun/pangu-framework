"use strict";(self.webpackChunkpangu_website=self.webpackChunkpangu_website||[]).push([[5162],{3905:(e,t,a)=>{a.d(t,{Zo:()=>o,kt:()=>g});var n=a(7294);function r(e,t,a){return t in e?Object.defineProperty(e,t,{value:a,enumerable:!0,configurable:!0,writable:!0}):e[t]=a,e}function l(e,t){var a=Object.keys(e);if(Object.getOwnPropertySymbols){var n=Object.getOwnPropertySymbols(e);t&&(n=n.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),a.push.apply(a,n)}return a}function s(e){for(var t=1;t<arguments.length;t++){var a=null!=arguments[t]?arguments[t]:{};t%2?l(Object(a),!0).forEach((function(t){r(e,t,a[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(a)):l(Object(a)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(a,t))}))}return e}function i(e,t){if(null==e)return{};var a,n,r=function(e,t){if(null==e)return{};var a,n,r={},l=Object.keys(e);for(n=0;n<l.length;n++)a=l[n],t.indexOf(a)>=0||(r[a]=e[a]);return r}(e,t);if(Object.getOwnPropertySymbols){var l=Object.getOwnPropertySymbols(e);for(n=0;n<l.length;n++)a=l[n],t.indexOf(a)>=0||Object.prototype.propertyIsEnumerable.call(e,a)&&(r[a]=e[a])}return r}var p=n.createContext({}),d=function(e){var t=n.useContext(p),a=t;return e&&(a="function"==typeof e?e(t):s(s({},t),e)),a},o=function(e){var t=d(e.components);return n.createElement(p.Provider,{value:t},e.children)},u="mdxType",c={inlineCode:"code",wrapper:function(e){var t=e.children;return n.createElement(n.Fragment,{},t)}},m=n.forwardRef((function(e,t){var a=e.components,r=e.mdxType,l=e.originalType,p=e.parentName,o=i(e,["components","mdxType","originalType","parentName"]),u=d(a),m=r,g=u["".concat(p,".").concat(m)]||u[m]||c[m]||l;return a?n.createElement(g,s(s({ref:t},o),{},{components:a})):n.createElement(g,s({ref:t},o))}));function g(e,t){var a=arguments,r=t&&t.mdxType;if("string"==typeof e||r){var l=a.length,s=new Array(l);s[0]=m;var i={};for(var p in t)hasOwnProperty.call(t,p)&&(i[p]=t[p]);i.originalType=e,i[u]="string"==typeof e?e:r,s[1]=i;for(var d=2;d<l;d++)s[d]=a[d];return n.createElement.apply(null,s)}return n.createElement.apply(null,a)}m.displayName="MDXCreateElement"},5162:(e,t,a)=>{a.d(t,{Z:()=>s});var n=a(7294),r=a(6010);const l="tabItem_Ymn6";function s(e){let{children:t,hidden:a,className:s}=e;return n.createElement("div",{role:"tabpanel",className:(0,r.Z)(l,s),hidden:a},t)}},5488:(e,t,a)=>{a.d(t,{Z:()=>m});var n=a(7462),r=a(7294),l=a(6010),s=a(2389),i=a(7392),p=a(7094),d=a(2466);const o="tabList__CuJ",u="tabItem_LNqP";function c(e){const{lazy:t,block:a,defaultValue:s,values:c,groupId:m,className:g}=e,k=r.Children.map(e.children,(e=>{if((0,r.isValidElement)(e)&&"value"in e.props)return e;throw new Error(`Docusaurus error: Bad <Tabs> child <${"string"==typeof e.type?e.type:e.type.name}>: all children of the <Tabs> component should be <TabItem>, and every <TabItem> should have a unique "value" prop.`)})),h=c??k.map((e=>{let{props:{value:t,label:a,attributes:n}}=e;return{value:t,label:a,attributes:n}})),v=(0,i.l)(h,((e,t)=>e.value===t.value));if(v.length>0)throw new Error(`Docusaurus error: Duplicate values "${v.map((e=>e.value)).join(", ")}" found in <Tabs>. Every value needs to be unique.`);const b=null===s?s:s??k.find((e=>e.props.default))?.props.value??k[0].props.value;if(null!==b&&!h.some((e=>e.value===b)))throw new Error(`Docusaurus error: The <Tabs> has a defaultValue "${b}" but none of its children has the corresponding value. Available values are: ${h.map((e=>e.value)).join(", ")}. If you intend to show no default tab, use defaultValue={null} instead.`);const{tabGroupChoices:y,setTabGroupChoices:f}=(0,p.U)(),[N,E]=(0,r.useState)(b),w=[],{blockElementScrollPositionUntilNextRender:B}=(0,d.o5)();if(null!=m){const e=y[m];null!=e&&e!==N&&h.some((t=>t.value===e))&&E(e)}const x=e=>{const t=e.currentTarget,a=w.indexOf(t),n=h[a].value;n!==N&&(B(t),E(n),null!=m&&f(m,String(n)))},O=e=>{let t=null;switch(e.key){case"Enter":x(e);break;case"ArrowRight":{const a=w.indexOf(e.currentTarget)+1;t=w[a]??w[0];break}case"ArrowLeft":{const a=w.indexOf(e.currentTarget)-1;t=w[a]??w[w.length-1];break}}t?.focus()};return r.createElement("div",{className:(0,l.Z)("tabs-container",o)},r.createElement("ul",{role:"tablist","aria-orientation":"horizontal",className:(0,l.Z)("tabs",{"tabs--block":a},g)},h.map((e=>{let{value:t,label:a,attributes:s}=e;return r.createElement("li",(0,n.Z)({role:"tab",tabIndex:N===t?0:-1,"aria-selected":N===t,key:t,ref:e=>w.push(e),onKeyDown:O,onClick:x},s,{className:(0,l.Z)("tabs__item",u,s?.className,{"tabs__item--active":N===t})}),a??t)}))),t?(0,r.cloneElement)(k.filter((e=>e.props.value===N))[0],{className:"margin-top--md"}):r.createElement("div",{className:"margin-top--md"},k.map(((e,t)=>(0,r.cloneElement)(e,{key:t,hidden:e.props.value!==N})))))}function m(e){const t=(0,s.Z)();return r.createElement(c,(0,n.Z)({key:String(t)},e))}},8149:(e,t,a)=>{a.r(t),a.d(t,{assets:()=>o,contentTitle:()=>p,default:()=>m,frontMatter:()=>i,metadata:()=>d,toc:()=>u});var n=a(7462),r=(a(7294),a(3905)),l=a(5488),s=a(5162);const i={title:"\u6570\u636e\u6cbb\u7406\u4e4b\u8bfb\u5199\u5206\u79bb",tags:["\u6570\u636e\u5206\u7247","\u8bfb\u5199\u5206\u79bb","\u6570\u636e\u6301\u4e45\u5316"],sidebar_position:25,slug:"/advanced-guide/readwrite-splitting"},p=void 0,d={unversionedId:"advanced-guide/\u6570\u636e\u6cbb\u7406\u4e4b\u8bfb\u5199\u5206\u79bb",id:"advanced-guide/\u6570\u636e\u6cbb\u7406\u4e4b\u8bfb\u5199\u5206\u79bb",title:"\u6570\u636e\u6cbb\u7406\u4e4b\u8bfb\u5199\u5206\u79bb",description:"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6 | \u8bfb\u5199\u5206\u79bb | \u6570\u636e\u5206\u7247 | \u6570\u636e\u52a0\u5bc6 | \u6570\u636e\u6cbb\u7406 | ShardingSphere-JDBC",source:"@site/docs/advanced-guide/\u6570\u636e\u6cbb\u7406\u4e4b\u8bfb\u5199\u5206\u79bb.md",sourceDirName:"advanced-guide",slug:"/advanced-guide/readwrite-splitting",permalink:"/pangu-framework/docs/advanced-guide/readwrite-splitting",draft:!1,editUrl:"https://gitee.com/pulanos/pangu-framework/tree/master/pangu-website/docs/advanced-guide/\u6570\u636e\u6cbb\u7406\u4e4b\u8bfb\u5199\u5206\u79bb.md",tags:[{label:"\u6570\u636e\u5206\u7247",permalink:"/pangu-framework/docs/tags/\u6570\u636e\u5206\u7247"},{label:"\u8bfb\u5199\u5206\u79bb",permalink:"/pangu-framework/docs/tags/\u8bfb\u5199\u5206\u79bb"},{label:"\u6570\u636e\u6301\u4e45\u5316",permalink:"/pangu-framework/docs/tags/\u6570\u636e\u6301\u4e45\u5316"}],version:"current",lastUpdatedBy:"xiongchun",lastUpdatedAt:1672663803,formattedLastUpdatedAt:"2023\u5e741\u67082\u65e5",sidebarPosition:25,frontMatter:{title:"\u6570\u636e\u6cbb\u7406\u4e4b\u8bfb\u5199\u5206\u79bb",tags:["\u6570\u636e\u5206\u7247","\u8bfb\u5199\u5206\u79bb","\u6570\u636e\u6301\u4e45\u5316"],sidebar_position:25,slug:"/advanced-guide/readwrite-splitting"},sidebar:"tutorialSidebar",previous:{title:"\u6d88\u606f\u961f\u5217",permalink:"/pangu-framework/docs/advanced-guide/mq"},next:{title:"\u6570\u636e\u6cbb\u7406\u4e4b\u6570\u636e\u5206\u7247",permalink:"/pangu-framework/docs/advanced-guide/data-sharding"}},o={},u=[{value:"\u8bfb\u5199\u5206\u79bb\u6982\u5ff5",id:"\u8bfb\u5199\u5206\u79bb\u6982\u5ff5",level:2},{value:"\u8bfb\u5199\u5206\u79bb\u540e\u9762\u4e34\u7684\u95ee\u9898",id:"\u8bfb\u5199\u5206\u79bb\u540e\u9762\u4e34\u7684\u95ee\u9898",level:3},{value:"\u76f8\u5173\u4e13\u4e1a\u672f\u8bed",id:"\u76f8\u5173\u4e13\u4e1a\u672f\u8bed",level:3},{value:"\u8bfb\u5199\u5206\u79bb\u5b9e\u73b0\u539f\u7406",id:"\u8bfb\u5199\u5206\u79bb\u5b9e\u73b0\u539f\u7406",level:2},{value:"\u7f16\u7a0b\u5b9e\u6218",id:"\u7f16\u7a0b\u5b9e\u6218",level:2},{value:"\u521d\u59cb\u5316\u6570\u636e\u5e93\u73af\u5883",id:"\u521d\u59cb\u5316\u6570\u636e\u5e93\u73af\u5883",level:3},{value:"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6a21\u5757",id:"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6a21\u5757",level:3},{value:"\u672c\u5730\u914d\u7f6e",id:"\u672c\u5730\u914d\u7f6e",level:3},{value:"\u6d4b\u8bd5\u7528\u4f8b",id:"\u6d4b\u8bd5\u7528\u4f8b",level:2},{value:"\u542f\u52a8\u7c7b",id:"\u542f\u52a8\u7c7b",level:3},{value:"\u6d4b\u8bd5\u5199\u64cd\u4f5c\u81ea\u52a8\u8d70\u4e3b\u5e93",id:"\u6d4b\u8bd5\u5199\u64cd\u4f5c\u81ea\u52a8\u8d70\u4e3b\u5e93",level:3},{value:"\u6d4b\u8bd5\u8bfb\u64cd\u4f5c\u81ea\u52a8\u8d70\u4ece\u5e93\u8d1f\u8f7d\u5747\u8861",id:"\u6d4b\u8bd5\u8bfb\u64cd\u4f5c\u81ea\u52a8\u8d70\u4ece\u5e93\u8d1f\u8f7d\u5747\u8861",level:3},{value:"\u6d4b\u8bd5\u8bfb\u64cd\u4f5c\u5f3a\u5236\u8d70\u4e3b\u5e93",id:"\u6d4b\u8bd5\u8bfb\u64cd\u4f5c\u5f3a\u5236\u8d70\u4e3b\u5e93",level:3},{value:"\u6d4b\u8bd5\u4e8b\u52a1\u65b9\u6cd5\u81ea\u52a8\u8d70\u4e3b\u5e93",id:"\u6d4b\u8bd5\u4e8b\u52a1\u65b9\u6cd5\u81ea\u52a8\u8d70\u4e3b\u5e93",level:3},{value:"\u672c\u6587\u76f8\u5173\u8303\u4f8b\u6e90\u7801",id:"\u672c\u6587\u76f8\u5173\u8303\u4f8b\u6e90\u7801",level:2},{value:"\u4e0b\u4e00\u6b65",id:"\u4e0b\u4e00\u6b65",level:2}],c={toc:u};function m(e){let{components:t,...i}=e;return(0,r.kt)("wrapper",(0,n.Z)({},c,i,{components:t,mdxType:"MDXLayout"}),(0,r.kt)("head",null,(0,r.kt)("title",null,"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6 | \u8bfb\u5199\u5206\u79bb | \u6570\u636e\u5206\u7247 | \u6570\u636e\u52a0\u5bc6 | \u6570\u636e\u6cbb\u7406 | ShardingSphere-JDBC"),(0,r.kt)("meta",{name:"keywords",content:"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6 | \u8bfb\u5199\u5206\u79bb | \u6570\u636e\u5206\u7247 | \u6570\u636e\u52a0\u5bc6 | \u6570\u636e\u6cbb\u7406 | ShardingSphere-JDBC"})),(0,r.kt)("p",null,"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6\u96c6\u6210\u4e86\u6570\u636e\u5e93\u4e2d\u95f4\u4ef6 ",(0,r.kt)("a",{parentName:"p",href:"https://shardingsphere.apache.org/index.html"},"ShardingSphere")," \u6765\u63d0\u4f9b\u6570\u636e\u6cbb\u7406\u76f8\u5173\u529f\u80fd\u3002\u5982\uff1a\u8bfb\u5199\u5206\u79bb\u3001\u6570\u636e\u5206\u7247\u3001\u6570\u636e\u52a0\u5bc6\u7b49\u3002"),(0,r.kt)("h2",{id:"\u8bfb\u5199\u5206\u79bb\u6982\u5ff5"},"\u8bfb\u5199\u5206\u79bb\u6982\u5ff5"),(0,r.kt)("p",null,"\u968f\u7740\u4e1a\u52a1\u7cfb\u7edf\u65e5\u76ca\u589e\u52a0\u7684\u7cfb\u7edf\u8bbf\u95ee\u91cf\uff0c\u6570\u636e\u5e93\u7684\u541e\u5410\u91cf\u5f80\u5f80\u6210\u4e3a\u7cfb\u7edf\u5e76\u53d1\u7684\u6027\u80fd\u74f6\u9888\u3002\u5bf9\u4e8e\u540c\u4e00\u65f6\u523b\u6709\u5927\u91cf\u5e76\u53d1\u8bfb\u64cd\u4f5c\u548c\u8f83\u5c11\u5199\u64cd\u4f5c\u7c7b\u578b\u7684\u5e94\u7528\u7cfb\u7edf\u6765\u8bf4\uff0c\u5c06\u6570\u636e\u5e93\u62c6\u5206\u4e3a\u4e3b\u5e93\u548c\u4ece\u5e93\u642d\u67b6\u4e3b\u4ece\u96c6\u7fa4\uff0c\u7531\u4e3b\u5e93\u8d1f\u8d23\u5904\u7406\u4e8b\u52a1\u6027\u7684\u589e\u5220\u6539\u64cd\u4f5c\uff0c\u4ece\u5e93\u8d1f\u8d23\u5904\u7406\u67e5\u8be2\u64cd\u4f5c\uff0c\u80fd\u591f\u6709\u6548\u7684\u907f\u514d\u6570\u636e\u66f4\u65b0\u5bfc\u81f4\u7684\u884c\u9501\uff0c\u4ece\u800c\u4e00\u5b9a\u7a0b\u5ea6\u63d0\u5347\u6574\u4e2a\u7cfb\u7edf\u7684\u8bfb\u5199\u5e76\u53d1\u6027\u80fd\u3002\u5982\u4e0b\u56fe\u6240\u793a\u3002"),(0,r.kt)("img",{width:"400",src:a(9137).Z,alt:"\u865a\u62df\u4e1a\u52a1\u573a\u666f\u8bbe\u8ba1"}),(0,r.kt)("admonition",{title:"\u63d0\u793a",type:"tip"},(0,r.kt)("p",{parentName:"admonition"},"\u76ee\u524d\u652f\u6301\u4e00\u4e3b\u4e00\u4ece\u6216\u4e00\u4e3b\u591a\u4ece\u7684\u4e3b\u4ece\u96c6\u7fa4\u67b6\u6784\uff0c\u4e0d\u652f\u6301\u591a\u4e3b\u5199\u7684\u67b6\u6784\u3002\u5bf9\u4e8e\u591a\u4ece\u7684\u67b6\u6784\u53ef\u6839\u636e\u8def\u7531\u7b97\u6cd5\u505a\u8bfb\u8d1f\u8f7d\u5747\u8861\uff0c\u4ee5\u5c06\u67e5\u8be2\u8bf7\u6c42\u5747\u5300\u7684\u5206\u6563\u5230\u591a\u4e2a\u6570\u636e\u526f\u672c\u3002\uff08\u6570\u636e\u5e93\u4e3b\u4ece\u67b6\u6784\u642d\u67b6\u4e0d\u5728\u672c\u6587\u8ba8\u8bba\u8303\u56f4\u4e4b\u5185\uff09")),(0,r.kt)("h3",{id:"\u8bfb\u5199\u5206\u79bb\u540e\u9762\u4e34\u7684\u95ee\u9898"},"\u8bfb\u5199\u5206\u79bb\u540e\u9762\u4e34\u7684\u95ee\u9898"),(0,r.kt)("p",null,"\u5bf9\u4e8e\u4e00\u822c\u7684\u7b80\u5355\u7406\u89e3\uff0c\u8bfb\u5199\u5206\u79bb\u5c31\u662f DQL \u8bf7\u6c42\u8d70\u4ece\u5e93\uff0cDML \u8bf7\u6c42\u8d70\u4e3b\u5e93\u3002\u4f46\u5bf9\u4e8e\u5f00\u53d1\u4eba\u5458\u800c\u8a00\uff0c\u5728\u5b9e\u9645\u5f00\u53d1\u4e2d\u8fd8\u9700\u8981\u8003\u8651\u5982\u4e0b\u95ee\u9898\u3002"),(0,r.kt)("ul",null,(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("p",{parentName:"li"},(0,r.kt)("strong",{parentName:"p"},"\u4e3b\u4ece\u6570\u636e\u540c\u6b65\u5ef6\u8fdf\u95ee\u9898"),(0,r.kt)("br",{parentName:"p"}),"\n","\u56e0\u4e3a\u6211\u4eec\u4e3b\u4ece\u540c\u6b65\u662f\u5f02\u6b65\u590d\u5236\u7684\uff0c\u4e0d\u53ef\u907f\u514d\u7684\u4f1a\u6709\u5ef6\u8fdf\u3002\u56e0\u6b64\u6709\u53ef\u80fd\u51fa\u73b0 mastre \u8282\u70b9\u5df2\u7ecf\u5199\u5165\uff0c\u4f46\u662f\u4ece slave \u8282\u70b9\u8bfb\u53d6\u4e0d\u5230\u6570\u636e\u7684\u95ee\u9898\u3002\u89e3\u51b3\u65b9\u6cd5\u89c1\u540e\u7eed\u7ae0\u8282\uff1a",(0,r.kt)("a",{parentName:"p",href:"#%E8%AF%BB%E6%93%8D%E4%BD%9C%E5%BC%BA%E5%88%B6%E8%B5%B0%E4%B8%BB%E5%BA%93"},"\u8bfb\u64cd\u4f5c\u5f3a\u5236\u8d70\u4e3b\u5e93")," \u548c ",(0,r.kt)("a",{parentName:"p",href:"#%E4%BA%8B%E5%8A%A1%E6%96%B9%E6%B3%95%E9%87%8C%E7%9A%84%E6%89%80%E6%9C%89%E8%AF%BB%E5%86%99%E6%93%8D%E4%BD%9C%E9%83%BD%E8%87%AA%E5%8A%A8%E8%B5%B0%E4%B8%BB%E5%BA%93"},"\u4e8b\u52a1\u65b9\u6cd5\u91cc\u7684\u6240\u6709\u8bfb\u5199\u64cd\u4f5c\u90fd\u81ea\u52a8\u8d70\u4e3b\u5e93"),"\u3002")),(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("p",{parentName:"li"},(0,r.kt)("strong",{parentName:"p"},"\u4e8b\u52a1\u95ee\u9898"),"\n\u5982\u679c\u4e00\u4e2a\u4e8b\u52a1\u65b9\u6cd5\u91cc\u65e2\u5305\u542b\u6709 DML \u8bf7\u6c42\u4e5f\u6709 DQL \u8bf7\u6c42\uff0c\u5982\u679c\u8bfb\u8bf7\u6c42\u8d70\u4ece\u5e93\u5199\u8bf7\u6c42\u8d70\u4e3b\u5e93\u7684\u8bdd\uff0c\u5219\u52bf\u5fc5\u4f1a\u5e26\u6765\u5206\u5e03\u5f0f\u4e8b\u52a1\u7684\u95ee\u9898\u3002\u4f46\u5bf9\u4e8e\u5927\u90e8\u5206\u8bfb\u5199\u5206\u79bb\u573a\u666f\u800c\u8a00\uff0c\u5f88\u663e\u7136\u6211\u4eec\u5e76\u4e0d\u5e0c\u671b\u4e3a\u4e86\u8bfb\u5199\u5206\u79bb\u800c\u53bb\u5904\u7406\u5206\u5e03\u5f0f\u4e8b\u52a1\u7684\u95ee\u9898\u3002\u56e0\u6b64\u5bf9\u4e8e\u8bfb\u5199\u5206\u79bb\uff0c\u6070\u5f53\u7684\u505a\u6cd5\u662f\u5c06\u4e8b\u52a1\u65b9\u6cd5\u4e2d\u7684\u6240\u6709 SQL \u8bf7\u6c42\u7edf\u4e00\u90fd\u8d70\u4e3b\u5e93\uff0c\u5c06\u8de8\u5e93\u7684\u5206\u5e03\u5f0f\u4e8b\u52a1\u8f6c\u4e3a\u672c\u5730\u4e8b\u52a1\u6765\u5904\u7406\u3002\u89c1\u540e\u7eed\u7ae0\u8282\uff1a",(0,r.kt)("a",{parentName:"p",href:"#%E4%BA%8B%E5%8A%A1%E6%96%B9%E6%B3%95%E9%87%8C%E7%9A%84%E6%89%80%E6%9C%89%E8%AF%BB%E5%86%99%E6%93%8D%E4%BD%9C%E9%83%BD%E8%87%AA%E5%8A%A8%E8%B5%B0%E4%B8%BB%E5%BA%93"},"\u4e8b\u52a1\u65b9\u6cd5\u91cc\u7684\u6240\u6709\u8bfb\u5199\u64cd\u4f5c\u90fd\u81ea\u52a8\u8d70\u4e3b\u5e93"),"\u3002\uff08\u5982\u679c\u5bf9\u4e8e\u5206\u5e03\u5f0f\u573a\u666f\u4e0b\u7684\u5206\u5e03\u5f0f\u4e8b\u52a1\u95ee\u9898\u7684\u5904\u7406\u611f\u5174\u8da3\uff0c\u53ef\u4ee5\u53c2\u8003\uff1a",(0,r.kt)("a",{parentName:"p",href:"/docs/advanced-guide/distributed-transaction"},"\u76d8\u53e4\u6846\u67b6\u5206\u5e03\u5f0f\u4e8b\u52a1\u6700\u4f73\u5b9e\u8df5"),"\uff09"))),(0,r.kt)("h3",{id:"\u76f8\u5173\u4e13\u4e1a\u672f\u8bed"},"\u76f8\u5173\u4e13\u4e1a\u672f\u8bed"),(0,r.kt)("ul",null,(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("strong",{parentName:"li"},"\u4e3b\u5e93"),"\uff1a\u6570\u636e DML \u5199\u64cd\u4f5c\uff08insert\u3001update\u3001delete\uff09\u4f7f\u7528\u7684\u6570\u636e\u5e93\u3002\u4ec5\u652f\u6301\u5355\u4e3b\u5e93\u3002"),(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("strong",{parentName:"li"},"\u4ece\u5e93"),"\uff1a\u6570\u636e DQL \u8bfb\u64cd\u4f5c\uff08select\uff09\u4f7f\u7528\u7684\u6570\u636e\u5e93\u3002\u53ef\u652f\u6301\u591a\u4ece\u5e93\u3002"),(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("strong",{parentName:"li"},"\u4e3b\u4ece\u540c\u6b65"),"\uff1a\u5c06\u4e3b\u5e93\u6570\u636e\u540c\u6b65\u5230\u4ece\u5e93\u7684\u64cd\u4f5c\u3002\u4f9d\u8d56\u6570\u636e\u5e93\u81ea\u8eab\u7684\u540c\u6b65\u673a\u5236\uff0c\u6bd4\u5982\uff1aMySQL \u57fa\u4e8e binlog \u7684\u5f02\u6b65\u590d\u5236\u3002")),(0,r.kt)("h2",{id:"\u8bfb\u5199\u5206\u79bb\u5b9e\u73b0\u539f\u7406"},"\u8bfb\u5199\u5206\u79bb\u5b9e\u73b0\u539f\u7406"),(0,r.kt)("p",null,"\u5b9e\u73b0\u8bfb\u5199\u5206\u79bb\u5927\u81f4\u6709 3 \u79cd\u65b9\u6848\u3002\u5982\u4e0b\u56fe\u6240\u793a\u3002"),(0,r.kt)("img",{width:"800",src:a(2143).Z,alt:"\u8bfb\u5199\u5206\u79bb\u5b9e\u73b0\u539f\u7406"}),(0,r.kt)("ul",null,(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("p",{parentName:"li"},(0,r.kt)("strong",{parentName:"p"},"\u6570\u636e\u5e93\u4ee3\u7406\u6a21\u5f0f\uff08\u670d\u52a1\u7aef\u4ee3\u7406\uff09"),(0,r.kt)("br",{parentName:"p"}),"\n","\u5728\u6570\u636e\u5e93\u548c\u5e94\u7528\u7cfb\u7edf\u4e4b\u95f4\u72ec\u7acb\u90e8\u7f72\u4e00\u4e2a\u6570\u636e\u5e93\u4ee3\u7406\u4e2d\u95f4\u4ef6\uff0c\u6240\u6709\u7684 SQL \u8bf7\u6c42\u5148\u53d1\u9001\u5230\u8fd9\u4e2a\u4ee3\u7406\uff0c\u7531\u5b83\u5b8c\u6210 SQL \u89e3\u6790\u3001SQL \u8def\u7531\u7b49\u5fc5\u8981\u64cd\u4f5c\u3002\u5728\u8fd9\u79cd\u6a21\u5f0f\u4e0b\uff0c\u8def\u7531\u89c4\u5219\u90fd\u914d\u7f6e\u5230\u4ee3\u7406\u4e0a\uff0c\u8bfb\u5199\u5206\u79bb\u7684\u903b\u8f91\u5bf9\u5f00\u53d1\u4eba\u5458\u662f\u900f\u660e\u7684\u3002")),(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("p",{parentName:"li"},(0,r.kt)("strong",{parentName:"p"},"\u6570\u636e\u6e90\u4ee3\u7406\u6a21\u5f0f\uff08\u5ba2\u6237\u7aef\u4ee3\u7406\uff09"),(0,r.kt)("br",{parentName:"p"}),"\n","\u901a\u8fc7\u5728\u5e94\u7528\u7aef\u5f15\u5165\u7ec4\u4ef6\u5305\uff0c\u4ee3\u7406\u5e94\u7528\u666e\u901a\u6570\u636e\u6e90\u3002\u5728\u8fd9\u79cd\u6a21\u5f0f\u4e0b\uff0c\u8def\u7531\u89c4\u5219\u914d\u7f6e\u5230\u5e94\u7528\u4fa7\uff0c\u6240\u6709 SQL \u8bf7\u6c42\u90fd\u901a\u8fc7\u4ee3\u7406\u6570\u636e\u6e90\u5b8c\u6210 SQL \u89e3\u6790\u3001SQL \u8def\u7531\u7b49\u5fc5\u8981\u64cd\u4f5c\u3002")),(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("p",{parentName:"li"},(0,r.kt)("del",{parentName:"p"},(0,r.kt)("strong",{parentName:"del"},"ORM \u6846\u67b6\u4ee3\u7406\u6a21\u5f0f\uff08\u5ba2\u6237\u7aef\u4ee3\u7406\uff09")),(0,r.kt)("br",{parentName:"p"}),"\n","\u901a\u8fc7 ORM \u6846\u67b6\uff08Hibernate\u3001Mybatis \u7b49\uff09\u7684\u63d2\u4ef6\u3001\u62e6\u622a\u5668\u673a\u5236\u5b9e\u73b0\u3002\u8fd9\u53ea\u80fd\u7b97\u662f\u7279\u5b9a\u73af\u5883\u4e0b\u7684\u4e00\u79cd\u5b9e\u73b0\u65b9\u6cd5\uff0c\u4e0d\u80fd\u4f5c\u4e3a\u4e00\u5957\u5b8c\u6574\u7684\u6807\u51c6\u5316\u89e3\u51b3\u65b9\u6848\u3002\u6545\u5728\u6b64\u4e0d\u505a\u66f4\u591a\u63cf\u8ff0\u3002\n"))),(0,r.kt)("table",null,(0,r.kt)("thead",{parentName:"table"},(0,r.kt)("tr",{parentName:"thead"},(0,r.kt)("th",{parentName:"tr",align:null},(0,r.kt)("div",{style:{width:"120px"}},"\u5b9e\u73b0\u65b9\u5f0f")),(0,r.kt)("th",{parentName:"tr",align:null},"\u53ef\u9009\u7ec4\u4ef6"),(0,r.kt)("th",{parentName:"tr",align:null},(0,r.kt)("div",{style:{width:"150px"}},"\u4f18\u70b9")),(0,r.kt)("th",{parentName:"tr",align:null},(0,r.kt)("div",{style:{width:"200px"}},"\u7f3a\u70b9")))),(0,r.kt)("tbody",{parentName:"table"},(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("strong",{parentName:"td"},"\u6570\u636e\u5e93\u4ee3\u7406\u6a21\u5f0f")),(0,r.kt)("td",{parentName:"tr",align:null},"ShardingSphere-Proxy ",(0,r.kt)("br",null)," MyCat"),(0,r.kt)("td",{parentName:"tr",align:null},"\u591a\u8bed\u8a00\u652f\u6301",(0,r.kt)("br",null),"\u72ec\u7acb\u90e8\u7f72\uff08\u5347\u7ea7\u7b80\u5355\uff09",(0,r.kt)("br",null),"\u5bf9\u5f00\u53d1\u5b8c\u5168\u900f\u660e"),(0,r.kt)("td",{parentName:"tr",align:null},"\u72ec\u7acb\u90e8\u7f72\uff08\u589e\u52a0\u4e0d\u7a33\u5b9a\u56e0\u7d20\uff09",(0,r.kt)("br",null)," \u8fd0\u7ef4\u6210\u672c\u9ad8",(0,r.kt)("br",null),"\u6027\u80fd\u635f\u8017\u9ad8")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("strong",{parentName:"td"},"\u6570\u636e\u6e90\u4ee3\u7406\u6a21\u5f0f \ud83d\udc8b ")),(0,r.kt)("td",{parentName:"tr",align:null},"ShardingSphere-JDBC"),(0,r.kt)("td",{parentName:"tr",align:null},"\u96c6\u6210\u7b80\u5355\u3001\u8f7b\u677e\u9a7e\u9a6d",(0,r.kt)("br",null),"\u6027\u80fd\u8f83\u597d"),(0,r.kt)("td",{parentName:"tr",align:null},"\u5d4c\u5165 JAR\uff08\u5347\u7ea7\u9ebb\u70e6\uff09",(0,r.kt)("br",null),"\u65e5\u5e38\u6570\u636e\u7ef4\u62a4\u9ebb\u70e6")),(0,r.kt)("tr",{parentName:"tbody"},(0,r.kt)("td",{parentName:"tr",align:null},(0,r.kt)("strong",{parentName:"td"},(0,r.kt)("del",{parentName:"strong"},"ORM \u6846\u67b6\u4ee3\u7406\u6a21\u5f0f"))),(0,r.kt)("td",{parentName:"tr",align:null},"\u81ea\u7814/\u786c\u7f16\u7801"),(0,r.kt)("td",{parentName:"tr",align:null},"\u786c\u64b8\u4e00\u65f6\u723d"),(0,r.kt)("td",{parentName:"tr",align:null},"\u4e8b\u540e\u706b\u846c\u573a")))),(0,r.kt)("admonition",{type:"caution"},(0,r.kt)("p",{parentName:"admonition"},"\u76d8\u53e4\u5f00\u53d1\u6846\u67b6\u4f7f\u7528 ShardingSphere-JDBC \u7ec4\u4ef6\uff0c\u901a\u8fc7\u6570\u636e\u6e90\u4ee3\u7406\u7684\u65b9\u5f0f\u5b9e\u73b0\u8bfb\u5199\u5206\u79bb\u529f\u80fd\u3002")),(0,r.kt)("h2",{id:"\u7f16\u7a0b\u5b9e\u6218"},"\u7f16\u7a0b\u5b9e\u6218"),(0,r.kt)("p",null,"\u672c\u5b9e\u4f8b\u4ee5\u4e00\u4e3b\u4e8c\u4ece\u7684\u6570\u636e\u5e93\u4e3b\u4ece\u96c6\u7fa4\u4e3a\u4f8b\uff0c\u6765\u6f14\u793a\u5982\u4f55\u57fa\u4e8e\u76d8\u53e4\u6846\u67b6\u5f00\u53d1\u4e00\u4e2a\u8bfb\u5199\u5206\u79bb\u4e14\u652f\u6301\u8bfb\u8d1f\u8f7d\u5747\u8861\u7684\u8303\u4f8b\u7a0b\u5e8f\u3002"),(0,r.kt)("h3",{id:"\u521d\u59cb\u5316\u6570\u636e\u5e93\u73af\u5883"},"\u521d\u59cb\u5316\u6570\u636e\u5e93\u73af\u5883"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx",metastring:'title="\u4e3b\u5e93 DB"',title:'"\u4e3b\u5e93','DB"':!0},"create table t_order\n(\n    order_id bigint auto_increment primary key,\n    user_id  int         not null,\n    status   varchar(50) null\n)\n    comment '\u8ba2\u5355\u8868';\n")),(0,r.kt)("p",null,"\u6839\u636e\u4e0a\u8ff0\u811a\u672c\uff0c\u518d\u521b\u5efa\u4ece\u5e93 1 \u548c \u4ece\u5e93 2 \u7684 t_order \u8868\u3002\uff08\u4ec5\u6f14\u793a\u8bfb\u5199\u5206\u79bb\u6548\u679c\uff0c\u4e0d\u642d\u5efa\u771f\u5b9e\u4e3b\u4ece\u590d\u5236\u96c6\u7fa4\uff0c\u53ef\u624b\u5de5\u63d2\u5165\u4ece\u5e93\u6240\u9700\u6d4b\u8bd5\u6570\u636e\uff09"),(0,r.kt)("h3",{id:"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6a21\u5757"},"\u5b89\u88c5\u76f8\u5173\u76d8\u53e4\u6a21\u5757"),(0,r.kt)(l.Z,{defaultValue:"dependency3",mdxType:"Tabs"},(0,r.kt)(s.Z,{value:"parent",label:"\u76d8\u53e4 Parent",mdxType:"TabItem"},(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},"<parent>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-parent</artifactId>\n    <version>latest.version.xxx</version>\n    <relativePath/>\n</parent>\n"))),(0,r.kt)(s.Z,{value:"dependency1",label:"\u57fa\u7840\u6a21\u5757",mdxType:"TabItem"},(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-spring-boot-starter</artifactId>\n</dependency>\n"))),(0,r.kt)(s.Z,{value:"dependency2",label:"JDBC \u6a21\u5757",mdxType:"TabItem"},(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-jdbc-spring-boot-starter</artifactId>\n</dependency>\n"))),(0,r.kt)(s.Z,{value:"dependency3",label:"\u6570\u636e\u6cbb\u7406\u6a21\u5757",mdxType:"TabItem"},(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},"<dependency>\n    <groupId>com.gitee.pulanos.pangu</groupId>\n    <artifactId>pangu-data-governance-spring-boot-starter</artifactId>\n</dependency>\n")))),(0,r.kt)("h3",{id:"\u672c\u5730\u914d\u7f6e"},"\u672c\u5730\u914d\u7f6e"),(0,r.kt)("blockquote",null,(0,r.kt)("p",{parentName:"blockquote"},"\u4e3a\u4fbf\u4e8e\u7406\u89e3\uff0c\u672c\u6587\u57fa\u4e8e\u672c\u5730\u914d\u7f6e\u7684\u65b9\u5f0f\u7f16\u5199\u3002\u82e5\u6539\u4e3a\u6807\u51c6\u7684 Nacos \u914d\u7f6e\u4e2d\u5fc3\u6a21\u5f0f\uff0c\u8bf7\u53c2\u9605\uff1a",(0,r.kt)("a",{parentName:"p",href:"/docs/advanced-guide/nacos-config-center"},"\u914d\u7f6e\u4e2d\u5fc3"),"\u7ae0\u8282\u3002")),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},"spring.application.name=pangu-examples-shardingsphere-readwrite-splitting\n\nmybatis-plus.mapperLocations=classpath*:/mapper/**/*.xml\nmybatis-plus.configuration.log-impl=org.apache.ibatis.logging.stdout.StdOutImpl\n\n# print shardingsphere Actual SQL log\nspring.shardingsphere.props.sql-show=true\nspring.shardingsphere.datasource.names=ds-master,ds-slave-1,ds-slave-2\n\n# \u4e3b\u5e93\u6570\u636e\u6e90\u914d\u7f6e\nspring.shardingsphere.datasource.ds-master.type=com.zaxxer.hikari.HikariDataSource\nspring.shardingsphere.datasource.ds-master.driver-class-name=com.mysql.cj.jdbc.Driver\nspring.shardingsphere.datasource.ds-master.jdbc-url=jdbc:mysql://localhost:3306/pangu-examples\nspring.shardingsphere.datasource.ds-master.username=root\nspring.shardingsphere.datasource.ds-master.password=123456\n\n# \u4ece\u5e93 1 \u6570\u636e\u6e90\u914d\u7f6e\nspring.shardingsphere.datasource.ds-slave-1.type=com.zaxxer.hikari.HikariDataSource\nspring.shardingsphere.datasource.ds-slave-1.driver-class-name=com.mysql.cj.jdbc.Driver\nspring.shardingsphere.datasource.ds-slave-1.jdbc-url=jdbc:mysql://localhost:3306/pangu-examples-0\nspring.shardingsphere.datasource.ds-slave-1.username=root\nspring.shardingsphere.datasource.ds-slave-1.password=123456\n\n# \u4ece\u5e93 2 \u6570\u636e\u6e90\u914d\u7f6e\nspring.shardingsphere.datasource.ds-slave-2.type=com.zaxxer.hikari.HikariDataSource\nspring.shardingsphere.datasource.ds-slave-2.driver-class-name=com.mysql.cj.jdbc.Driver\nspring.shardingsphere.datasource.ds-slave-2.jdbc-url=jdbc:mysql://localhost:3306/pangu-examples-1\nspring.shardingsphere.datasource.ds-slave-2.username=root\nspring.shardingsphere.datasource.ds-slave-2.password=123456\n\n# \u8bfb\u5199\u5206\u79bb\u7b56\u7565\u914d\u7f6e\nspring.shardingsphere.rules.readwrite-splitting.data-sources.pangu-rws.type=Static\n# \u5199\u6570\u636e\u6e90\u914d\u7f6e\nspring.shardingsphere.rules.readwrite-splitting.data-sources.pangu-rws.props.write-data-source-name=ds-master\n# \u8bfb\u6570\u636e\u6e90\u914d\u7f6e\nspring.shardingsphere.rules.readwrite-splitting.data-sources.pangu-rws.props.read-data-source-names=ds-slave-1,ds-slave-2\n# \u8bfb\u8d1f\u8f7d\u5747\u8861\u7b97\u6cd5\u914d\u7f6e\nspring.shardingsphere.rules.readwrite-splitting.load-balancers.read-random.type=RANDOM\n")),(0,r.kt)("h2",{id:"\u6d4b\u8bd5\u7528\u4f8b"},"\u6d4b\u8bd5\u7528\u4f8b"),(0,r.kt)("h3",{id:"\u542f\u52a8\u7c7b"},"\u542f\u52a8\u7c7b"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},"@EnableTransactionManagement\n@SpringBootApplication\npublic class ReadWriteSplittingApplication {\n    public static void main(String[] args) {\n        PanGuApplicationBuilder.init(ReadWriteSplittingApplication.class).run(args);\n    }\n}\n")),(0,r.kt)("h3",{id:"\u6d4b\u8bd5\u5199\u64cd\u4f5c\u81ea\u52a8\u8d70\u4e3b\u5e93"},"\u6d4b\u8bd5\u5199\u64cd\u4f5c\u81ea\u52a8\u8d70\u4e3b\u5e93"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},'@Test\npublic void writeRoute() {\n    TOrderEntity entity = new TOrderEntity().setUserId(1).setStatus("\u6d4b\u8bd5");\n    tOrderMapper.insert(entity);\n}\n')),(0,r.kt)("h3",{id:"\u6d4b\u8bd5\u8bfb\u64cd\u4f5c\u81ea\u52a8\u8d70\u4ece\u5e93\u8d1f\u8f7d\u5747\u8861"},"\u6d4b\u8bd5\u8bfb\u64cd\u4f5c\u81ea\u52a8\u8d70\u4ece\u5e93\u8d1f\u8f7d\u5747\u8861"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},"@Test\npublic void readRoute() {\n    tOrderMapper.selectById(1508317805991194627L);\n    tOrderMapper.selectById(1508317805991194628L);\n}\n")),(0,r.kt)("h3",{id:"\u6d4b\u8bd5\u8bfb\u64cd\u4f5c\u5f3a\u5236\u8d70\u4e3b\u5e93"},"\u6d4b\u8bd5\u8bfb\u64cd\u4f5c\u5f3a\u5236\u8d70\u4e3b\u5e93"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},'@Test\npublic void readByWriteRoute() {\n    HintManager hintManager = HintManager.getInstance();\n    hintManager.setWriteRouteOnly();\n    try {\n        log.info("\u67e5\u8be2\u6570\u636e\uff08\u5f3a\u5236\u8d70\u4e3b\u5e93\uff09...");\n        TOrderEntity entity = tOrderMapper.selectById(2L);\n        log.info("\u67e5\u8be2\u7ed3\u679c {}", entity);\n    } finally {\n        hintManager.close();\n    }\n}\n')),(0,r.kt)("h3",{id:"\u6d4b\u8bd5\u4e8b\u52a1\u65b9\u6cd5\u81ea\u52a8\u8d70\u4e3b\u5e93"},"\u6d4b\u8bd5\u4e8b\u52a1\u65b9\u6cd5\u81ea\u52a8\u8d70\u4e3b\u5e93"),(0,r.kt)("p",null,"\u4e8b\u52a1\u65b9\u6cd5\u91cc\u7684\u6240\u6709\u8bfb\u5199\u64cd\u4f5c\u90fd\u81ea\u52a8\u8d70\u4e3b\u5e93\u3002"),(0,r.kt)("pre",null,(0,r.kt)("code",{parentName:"pre",className:"language-jsx"},'@Test\n@Transactional(rollbackFor = RuntimeException.class)\npublic void doWithTransaction() {\n    log.info("\u63d2\u5165\u6570\u636e...");\n    TOrderEntity entity = new TOrderEntity().setUserId(1).setStatus("\u6d4b\u8bd5");\n    tOrderMapper.insert(entity);\n    log.info("\u67e5\u8be2\u6570\u636e\uff08\u4e8b\u52a1\u65b9\u6cd5\u5185\u6240\u6709\u8bf7\u6c42\u81ea\u52a8\u8d70\u4e3b\u5e93\uff09...");\n    tOrderMapper.selectById(1L);\n}\n')),(0,r.kt)("h2",{id:"\u672c\u6587\u76f8\u5173\u8303\u4f8b\u6e90\u7801"},"\u672c\u6587\u76f8\u5173\u8303\u4f8b\u6e90\u7801"),(0,r.kt)("ul",null,(0,r.kt)("li",{parentName:"ul"},(0,r.kt)("a",{parentName:"li",href:"https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-shardingsphere-readwrite-splitting"},"pangu-examples-shardingsphere-readwrite-splitting"),"\uff1a\u6570\u636e\u6cbb\u7406\u4e4b\u8bfb\u5199\u5206\u79bb\u8303\u4f8b")),(0,r.kt)("h2",{id:"\u4e0b\u4e00\u6b65"},"\u4e0b\u4e00\u6b65"),(0,r.kt)("p",null,"\u7ee7\u7eed\u9605\u8bfb\u5176\u5b83\u7ae0\u8282\u83b7\u53d6\u4f60\u60f3\u8981\u7684\u7b54\u6848\u6216\u901a\u8fc7\u6211\u4eec\u7684 ",(0,r.kt)("a",{parentName:"p",href:"/community"},"\u5f00\u53d1\u8005\u793e\u533a")," \u5bfb\u6c42\u66f4\u591a\u5e2e\u52a9\u3002"))}m.isMDXComponent=!0},2143:(e,t,a)=>{a.d(t,{Z:()=>n});const n=a.p+"assets/images/27-pangu-framework-readwrite-splitting-895f2714eb8356719428797a474cfce6.png"},9137:(e,t,a)=>{a.d(t,{Z:()=>n});const n=a.p+"assets/images/28-pangu-framework-readwrite-splitting-5350969993059c6d60c320e0a46bab20.png"}}]);