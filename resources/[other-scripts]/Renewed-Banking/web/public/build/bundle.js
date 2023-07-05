var app=function(){"use strict";function t(){}function e(t){return t()}function n(){return Object.create(null)}function s(t){t.forEach(e)}function o(t){return"function"==typeof t}function a(t,e){return t!=t?e==e:t!==e||t&&"object"==typeof t||"function"==typeof t}function r(e,n,s){e.$$.on_destroy.push(function(e,...n){if(null==e)return t;const s=e.subscribe(...n);return s.unsubscribe?()=>s.unsubscribe():s}(n,s))}function c(t,e,n,s){return t[1]&&s?function(t,e){for(const n in e)t[n]=e[n];return t}(n.ctx.slice(),t[1](s(e))):n.ctx}function i(t,e){t.appendChild(e)}function l(t,e,n){t.insertBefore(e,n||null)}function u(t){t.parentNode&&t.parentNode.removeChild(t)}function d(t){return document.createElement(t)}function f(t){return document.createTextNode(t)}function p(){return f(" ")}function m(){return f("")}function g(t,e,n,s){return t.addEventListener(e,n,s),()=>t.removeEventListener(e,n,s)}function h(t,e,n){null==n?t.removeAttribute(e):t.getAttribute(e)!==n&&t.setAttribute(e,n)}function v(t){return""===t?null:+t}function $(t,e){e=""+e,t.wholeText!==e&&(t.data=e)}function w(t,e){t.value=null==e?"":e}function y(t,e,n,s){null===n?t.style.removeProperty(e):t.style.setProperty(e,n,s?"important":"")}function b(t,e,n){t.classList[n?"add":"remove"](e)}let _;function x(t){_=t}function k(){if(!_)throw new Error("Function called outside component initialization");return _}function F(t){k().$$.on_mount.push(t)}const C=[],L=[],j=[],T=[],S=Promise.resolve();let D=!1;function E(t){j.push(t)}const M=new Set;let z=0;function N(){if(0!==z)return;const t=_;do{try{for(;z<C.length;){const t=C[z];z++,x(t),I(t.$$)}}catch(t){throw C.length=0,z=0,t}for(x(null),C.length=0,z=0;L.length;)L.pop()();for(let t=0;t<j.length;t+=1){const e=j[t];M.has(e)||(M.add(e),e())}j.length=0}while(C.length);for(;T.length;)T.pop()();D=!1,M.clear(),x(t)}function I(t){if(null!==t.fragment){t.update(),s(t.before_update);const e=t.dirty;t.dirty=[-1],t.fragment&&t.fragment.p(t.ctx,e),t.after_update.forEach(E)}}const A=new Set;let q;function B(){q={r:0,c:[],p:q}}function O(){q.r||s(q.c),q=q.p}function U(t,e){t&&t.i&&(A.delete(t),t.i(e))}function P(t,e,n,s){if(t&&t.o){if(A.has(t))return;A.add(t),q.c.push((()=>{A.delete(t),s&&(n&&t.d(1),s())})),t.o(e)}else s&&s()}function V(t,e){P(t,1,1,(()=>{e.delete(t.key)}))}function W(t,e,n,s,o,a,r,c,i,l,u,d){let f=t.length,p=a.length,m=f;const g={};for(;m--;)g[t[m].key]=m;const h=[],v=new Map,$=new Map;for(m=p;m--;){const t=d(o,a,m),c=n(t);let i=r.get(c);i?s&&i.p(t,e):(i=l(c,t),i.c()),v.set(c,h[m]=i),c in g&&$.set(c,Math.abs(m-g[c]))}const w=new Set,y=new Set;function b(t){U(t,1),t.m(c,u),r.set(t.key,t),u=t.first,p--}for(;f&&p;){const e=h[p-1],n=t[f-1],s=e.key,o=n.key;e===n?(u=e.first,f--,p--):v.has(o)?!r.has(s)||w.has(s)?b(e):y.has(o)?f--:$.get(s)>$.get(o)?(y.add(s),b(e)):(w.add(o),f--):(i(n,r),f--)}for(;f--;){const e=t[f];v.has(e.key)||i(e,r)}for(;p;)b(h[p-1]);return h}function Y(t){t&&t.c()}function R(t,n,a,r){const{fragment:c,after_update:i}=t.$$;c&&c.m(n,a),r||E((()=>{const n=t.$$.on_mount.map(e).filter(o);t.$$.on_destroy?t.$$.on_destroy.push(...n):s(n),t.$$.on_mount=[]})),i.forEach(E)}function Z(t,e){const n=t.$$;null!==n.fragment&&(s(n.on_destroy),n.fragment&&n.fragment.d(e),n.on_destroy=n.fragment=null,n.ctx=[])}function J(t,e){-1===t.$$.dirty[0]&&(C.push(t),D||(D=!0,S.then(N)),t.$$.dirty.fill(0)),t.$$.dirty[e/31|0]|=1<<e%31}function X(e,o,a,r,c,i,l,d=[-1]){const f=_;x(e);const p=e.$$={fragment:null,ctx:[],props:i,update:t,not_equal:c,bound:n(),on_mount:[],on_destroy:[],on_disconnect:[],before_update:[],after_update:[],context:new Map(o.context||(f?f.$$.context:[])),callbacks:n(),dirty:d,skip_bound:!1,root:o.target||f.$$.root};l&&l(p.root);let m=!1;if(p.ctx=a?a(e,o.props||{},((t,n,...s)=>{const o=s.length?s[0]:n;return p.ctx&&c(p.ctx[t],p.ctx[t]=o)&&(!p.skip_bound&&p.bound[t]&&p.bound[t](o),m&&J(e,t)),n})):[],p.update(),m=!0,s(p.before_update),p.fragment=!!r&&r(p.ctx),o.target){if(o.hydrate){const t=function(t){return Array.from(t.childNodes)}(o.target);p.fragment&&p.fragment.l(t),t.forEach(u)}else p.fragment&&p.fragment.c();o.intro&&U(e.$$.fragment),R(e,o.target,o.anchor,o.customElement),N()}x(f)}class H{$destroy(){Z(this,1),this.$destroy=t}$on(e,n){if(!o(n))return t;const s=this.$$.callbacks[e]||(this.$$.callbacks[e]=[]);return s.push(n),()=>{const t=s.indexOf(n);-1!==t&&s.splice(t,1)}}$set(t){var e;this.$$set&&(e=t,0!==Object.keys(e).length)&&(this.$$.skip_bound=!0,this.$$set(t),this.$$.skip_bound=!1)}}const G=atob("UmVuZXdlZC1CYW5raW5n");async function Q(t,e={}){const n={method:"post",headers:{"Content-Type":"application/json; charset=UTF-8"},body:JSON.stringify(e)},s=await fetch(`https://${G}/${t}`,n);return await s.json()}const K=[];function tt(e,n=t){let s;const o=new Set;function r(t){if(a(e,t)&&(e=t,s)){const t=!K.length;for(const t of o)t[1](),K.push(t,e);if(t){for(let t=0;t<K.length;t+=2)K[t][0](K[t+1]);K.length=0}}}return{set:r,update:function(t){r(t(e))},subscribe:function(a,c=t){const i=[a,c];return o.add(i),1===o.size&&(s=n(r)||t),a(e),()=>{o.delete(i),0===o.size&&(s(),s=null)}}}}const et=tt(!1),nt=tt(!1),st=tt("");let ot=tt(null);const at=tt(!1);let rt=tt({account:{},actionType:""});const ct=tt([]),it=tt([]);function lt(t,e){const n=n=>{n.data.action===t&&e(n.data)};var s;F((()=>window.addEventListener("message",n))),s=()=>window.removeEventListener("message",n),k().$$.on_destroy.push(s)}const ut=()=>!window.invokeNative;function dt(t){return t.toLocaleString("en-US",{style:"currency",currency:"USD"})}function ft(t){let e;const n=t[2].default,s=function(t,e,n,s){if(t){const o=c(t,e,n,s);return t[0](o)}}(n,t,t[1],null);return{c(){s&&s.c()},m(t,n){s&&s.m(t,n),e=!0},p(t,o){s&&s.p&&(!e||2&o)&&function(t,e,n,s,o,a){if(o){const r=c(e,n,s,a);t.p(r,o)}}(s,n,t,t[1],e?function(t,e,n,s){if(t[2]&&s){const o=t[2](s(n));if(void 0===e.dirty)return o;if("object"==typeof o){const t=[],n=Math.max(e.dirty.length,o.length);for(let s=0;s<n;s+=1)t[s]=e.dirty[s]|o[s];return t}return e.dirty|o}return e.dirty}(n,t[1],o,null):function(t){if(t.ctx.length>32){const e=[],n=t.ctx.length/32;for(let t=0;t<n;t++)e[t]=-1;return e}return-1}(t[1]),null)},i(t){e||(U(s,t),e=!0)},o(t){P(s,t),e=!1},d(t){s&&s.d(t)}}}function pt(t){let e,n,s=t[0]&&ft(t);return{c(){s&&s.c(),e=m()},m(t,o){s&&s.m(t,o),l(t,e,o),n=!0},p(t,[n]){t[0]?s?(s.p(t,n),1&n&&U(s,1)):(s=ft(t),s.c(),U(s,1),s.m(e.parentNode,e)):s&&(B(),P(s,1,1,(()=>{s=null})),O())},i(t){n||(U(s),n=!0)},o(t){P(s),n=!1},d(t){s&&s.d(t),t&&u(e)}}}function mt(t,e,n){let s,{$$slots:o={},$$scope:a}=e;return et.subscribe((t=>{n(0,s=t)})),lt("setVisible",(t=>{ct.set(ut()?t.data.accounts:t.accounts),ot.update((()=>ut()?t.data.accounts[0].id:t.accounts[0].id)),et.set(ut()?t.data.status:t.status),nt.set(ut()?t.data.loading:t.loading),at.set(ut()?t.data.atm:t.atm)})),lt("setLoading",(t=>{nt.set(t.status)})),lt("notify",(t=>{st.set(t.status),setTimeout((()=>{st.set("")}),3500)})),lt("updateLocale",(t=>{it.set(t.translations)})),F((()=>{const t=t=>{s&&["Escape"].includes(t.code)&&(Q("closeInterface"),et.set(!1),rt.update((t=>Object.assign(Object.assign({},t),{actionType:""}))))};return window.addEventListener("keydown",t),()=>window.removeEventListener("keydown",t)})),t.$$set=t=>{"$$scope"in t&&n(1,a=t.$$scope)},[s,a,o]}class gt extends H{constructor(t){super(),X(this,t,mt,pt,a,{})}}function ht(t){let e,n=(t[1].frozen||"Frozen")+"";return{c(){e=f(n)},m(t,n){l(t,e,n)},p(t,s){2&s&&n!==(n=(t[1].frozen||"Frozen")+"")&&$(e,n)},d(t){t&&u(e)}}}function vt(t){let e,n,o,a,r,c,m,v,w,y,b=(t[1].deposit_but||"Deposit")+"",_=(t[1].withdraw_but||"Withdraw")+"",x=(t[1].transfer_but||"Transfer")+"";return{c(){e=d("button"),n=f(b),o=p(),a=d("button"),r=f(_),c=p(),m=d("button"),v=f(x),h(e,"class","btn btn-green svelte-1h08g45"),h(a,"class","btn btn-orange svelte-1h08g45"),h(m,"class","btn btn-grey svelte-1h08g45")},m(s,u){l(s,e,u),i(e,n),l(s,o,u),l(s,a,u),i(a,r),l(s,c,u),l(s,m,u),i(m,v),w||(y=[g(e,"click",t[4]),g(a,"click",t[5]),g(m,"click",t[6])],w=!0)},p(t,e){2&e&&b!==(b=(t[1].deposit_but||"Deposit")+"")&&$(n,b),2&e&&_!==(_=(t[1].withdraw_but||"Withdraw")+"")&&$(r,_),2&e&&x!==(x=(t[1].transfer_but||"Transfer")+"")&&$(v,x)},d(t){t&&u(e),t&&u(o),t&&u(a),t&&u(c),t&&u(m),w=!1,s(y)}}}function $t(e){let n,s,o,a,r,c,m,v,w,y,b,_,x,k,F,C,L,j,T,S,D=e[0].type+"",E=(e[1].account||" Account ")+"",M=e[0].id+"",z=e[0].name+"",N=dt(e[0].amount)+"";function I(t,e){return t[0].isFrozen?ht:vt}let A=I(e),q=A(e);return{c(){n=d("section"),s=d("h4"),o=f(D),a=f(E),r=f("/ "),c=f(M),m=p(),v=d("h5"),w=d("span"),y=f(z),b=p(),_=d("div"),x=d("strong"),k=f(N),F=p(),C=d("br"),L=p(),j=d("div"),q.c(),h(s,"class","svelte-1h08g45"),h(w,"class","svelte-1h08g45"),h(v,"class","svelte-1h08g45"),h(x,"class","svelte-1h08g45"),h(_,"class","price svelte-1h08g45"),h(j,"class","btns-group svelte-1h08g45"),h(n,"class","account svelte-1h08g45")},m(t,u){l(t,n,u),i(n,s),i(s,o),i(s,a),i(s,r),i(s,c),i(n,m),i(n,v),i(v,w),i(w,y),i(n,b),i(n,_),i(_,x),i(x,k),i(_,F),i(_,C),i(n,L),i(n,j),q.m(j,null),T||(S=g(n,"click",e[7]),T=!0)},p(t,[e]){1&e&&D!==(D=t[0].type+"")&&$(o,D),2&e&&E!==(E=(t[1].account||" Account ")+"")&&$(a,E),1&e&&M!==(M=t[0].id+"")&&$(c,M),1&e&&z!==(z=t[0].name+"")&&$(y,z),1&e&&N!==(N=dt(t[0].amount)+"")&&$(k,N),A===(A=I(t))&&q?q.p(t,e):(q.d(1),q=A(t),q&&(q.c(),q.m(j,null)))},i:t,o:t,d(t){t&&u(n),q.d(),T=!1,S()}}}function wt(t,e,n){let s,o;r(t,ct,(t=>n(9,s=t))),r(t,it,(t=>n(1,o=t)));let{account:a}=e;function c(t){ot.update((()=>t))}function i(t,e){let n=s.find((e=>t===e.id));rt.update((()=>({actionType:e,account:n})))}at.subscribe((t=>{}));return t.$$set=t=>{"account"in t&&n(0,a=t.account)},[a,o,c,i,()=>i(a.id,"deposit"),()=>i(a.id,"withdraw"),()=>i(a.id,"transfer"),()=>c(a.id)]}class yt extends H{constructor(t){super(),X(this,t,wt,$t,a,{account:0})}}function bt(t,e,n){const s=t.slice();return s[5]=e[n],s}function _t(e){let n;return{c(){n=d("h3"),n.textContent="No accounts found",y(n,"text-align","left"),y(n,"color","#F3F4F5"),y(n,"margin-top","1rem")},m(t,e){l(t,n,e)},p:t,i:t,o:t,d(t){t&&u(n)}}}function xt(t){let e,n,s=[],o=new Map,a=t[1].filter(t[4]);const r=t=>t[5].id;for(let e=0;e<a.length;e+=1){let n=bt(t,a,e),c=r(n);o.set(c,s[e]=kt(c,n))}return{c(){for(let t=0;t<s.length;t+=1)s[t].c();e=m()},m(t,o){for(let e=0;e<s.length;e+=1)s[e].m(t,o);l(t,e,o),n=!0},p(t,n){3&n&&(a=t[1].filter(t[4]),B(),s=W(s,n,r,1,t,a,o,e.parentNode,V,kt,e,bt),O())},i(t){if(!n){for(let t=0;t<a.length;t+=1)U(s[t]);n=!0}},o(t){for(let t=0;t<s.length;t+=1)P(s[t]);n=!1},d(t){for(let e=0;e<s.length;e+=1)s[e].d(t);t&&u(e)}}}function kt(t,e){let n,s,o;return s=new yt({props:{account:e[5]}}),{key:t,first:null,c(){n=m(),Y(s.$$.fragment),this.first=n},m(t,e){l(t,n,e),R(s,t,e),o=!0},p(t,n){e=t;const o={};3&n&&(o.account=e[5]),s.$set(o)},i(t){o||(U(s.$$.fragment,t),o=!0)},o(t){P(s.$$.fragment,t),o=!1},d(t){t&&u(n),Z(s,t)}}}function Ft(t){let e,n,s,o,a,r,c,f,m,v;const $=[xt,_t],y=[];function b(t,e){return 3&e&&(a=null),null==a&&(a=!!(t[1].filter(t[2]).length>0)),a?0:1}return r=b(t,-1),c=y[r]=$[r](t),{c(){e=d("aside"),n=d("input"),s=p(),o=d("section"),c.c(),h(n,"type","text"),h(n,"class","acc-search svelte-1rc0sab"),h(n,"placeholder","Account Search..."),h(o,"class","scroller"),h(e,"class","svelte-1rc0sab")},m(a,c){l(a,e,c),i(e,n),w(n,t[0]),i(e,s),i(e,o),y[r].m(o,null),f=!0,m||(v=g(n,"input",t[3]),m=!0)},p(t,[e]){1&e&&n.value!==t[0]&&w(n,t[0]);let s=r;r=b(t,e),r===s?y[r].p(t,e):(B(),P(y[s],1,1,(()=>{y[s]=null})),O(),c=y[r],c?c.p(t,e):(c=y[r]=$[r](t),c.c()),U(c,1),c.m(o,null))},i(t){f||(U(c),f=!0)},o(t){P(c),f=!1},d(t){t&&u(e),y[r].d(),m=!1,v()}}}function Ct(t,e,n){let s;r(t,ct,(t=>n(1,s=t)));let o="";return[o,s,t=>t.name.toLowerCase().includes(o.toLowerCase()),function(){o=this.value,n(0,o)},t=>t.name.toLowerCase().includes(o.toLowerCase())]}class Lt extends H{constructor(t){super(),X(this,t,Ct,Ft,a,{})}}function jt(e){let n,s,o,a,r,c,m,g,v,w,_,x,k,F,C,L,j,T,S,D,E,M,z,N,I,A,q,B,O,U,P,V,W=e[0].title+"",Y=e[0].trans_type.toUpperCase()+"",R=e[0].trans_id+"",Z=dt(e[0].amount)+"",J=e[0].time+"",X=e[0].issuer+"",H=e[0].receiver+"",G=(e[1].message||"Message")+"",Q=e[0].message+"";return{c(){n=d("section"),s=d("h5"),o=d("span"),a=f(W),r=p(),c=d("p"),m=f(Y),g=p(),v=d("span"),w=f(R),_=p(),x=d("h4"),k=d("div"),F=d("span"),C=d("i"),L=p(),j=f(Z),T=p(),S=d("span"),D=f(J),E=f(" - "),M=f(X),z=p(),N=d("span"),I=f(H),A=p(),q=d("h6"),B=f(G),O=p(),U=d("br"),P=p(),V=f(Q),h(c,"class","svelte-1g7gx3j"),h(o,"class","title-container svelte-1g7gx3j"),b(o,"withdrawTitle","withdraw"===e[0].trans_type),h(v,"class","trans_id svelte-1g7gx3j"),b(v,"withdrawId","withdraw"===e[0].trans_type),h(s,"class","svelte-1g7gx3j"),h(C,"class","fa-solid fa-money-bill"),h(F,"class","svelte-1g7gx3j"),b(F,"withdraw","withdraw"===e[0].trans_type),h(S,"class","svelte-1g7gx3j"),y(k,"display","flex"),y(k,"flex-direction","column"),y(k,"justify-content","flex-start"),y(k,"align-items","flex-start"),h(N,"class","svelte-1g7gx3j"),h(x,"class","svelte-1g7gx3j"),h(q,"class","svelte-1g7gx3j"),h(n,"class","transaction svelte-1g7gx3j")},m(t,e){l(t,n,e),i(n,s),i(s,o),i(o,a),i(o,r),i(o,c),i(c,m),i(s,g),i(s,v),i(v,w),i(n,_),i(n,x),i(x,k),i(k,F),i(F,C),i(F,L),i(F,j),i(k,T),i(k,S),i(S,D),i(S,E),i(S,M),i(x,z),i(x,N),i(N,I),i(n,A),i(n,q),i(q,B),i(q,O),i(q,U),i(q,P),i(q,V)},p(t,[e]){1&e&&W!==(W=t[0].title+"")&&$(a,W),1&e&&Y!==(Y=t[0].trans_type.toUpperCase()+"")&&$(m,Y),1&e&&b(o,"withdrawTitle","withdraw"===t[0].trans_type),1&e&&R!==(R=t[0].trans_id+"")&&$(w,R),1&e&&b(v,"withdrawId","withdraw"===t[0].trans_type),1&e&&Z!==(Z=dt(t[0].amount)+"")&&$(j,Z),1&e&&b(F,"withdraw","withdraw"===t[0].trans_type),1&e&&J!==(J=t[0].time+"")&&$(D,J),1&e&&X!==(X=t[0].issuer+"")&&$(M,X),1&e&&H!==(H=t[0].receiver+"")&&$(I,H),2&e&&G!==(G=(t[1].message||"Message")+"")&&$(B,G),1&e&&Q!==(Q=t[0].message+"")&&$(V,Q)},i:t,o:t,d(t){t&&u(n)}}}function Tt(t,e,n){let s;r(t,it,(t=>n(1,s=t)));let{transaction:o}=e;return t.$$set=t=>{"transaction"in t&&n(0,o=t.transaction)},[o,s]}class St extends H{constructor(t){super(),X(this,t,Tt,jt,a,{transaction:0})}}function Dt(t,e,n){const s=t.slice();return s[10]=e[n],s}function Et(e){let n,s=(e[3].select_account||"Select Account")+"";return{c(){n=f(s)},m(t,e){l(t,n,e)},p(t,e){8&e&&s!==(s=(t[3].select_account||"Select Account")+"")&&$(n,s)},i:t,o:t,d(t){t&&u(n)}}}function Mt(t){let e,n,s,o,a;const r=[Nt,zt],c=[];function i(t,n){return 5&n&&(e=null),null==e&&(e=!!(t[2].transactions.filter(t[7]).length>0)),e?0:1}return n=i(t,-1),s=c[n]=r[n](t),{c(){s.c(),o=m()},m(t,e){c[n].m(t,e),l(t,o,e),a=!0},p(t,e){let a=n;n=i(t,e),n===a?c[n].p(t,e):(B(),P(c[a],1,1,(()=>{c[a]=null})),O(),s=c[n],s?s.p(t,e):(s=c[n]=r[n](t),s.c()),U(s,1),s.m(o.parentNode,o))},i(t){a||(U(s),a=!0)},o(t){P(s),a=!1},d(t){c[n].d(t),t&&u(o)}}}function zt(e){let n;return{c(){n=d("h3"),n.textContent="No transactions found",y(n,"text-align","left"),y(n,"color","#F3F4F5"),y(n,"margin-top","1rem")},m(t,e){l(t,n,e)},p:t,i:t,o:t,d(t){t&&u(n)}}}function Nt(t){let e,n,s=[],o=new Map,a=t[2].transactions.filter(t[9]);const r=t=>t[10].trans_id;for(let e=0;e<a.length;e+=1){let n=Dt(t,a,e),c=r(n);o.set(c,s[e]=It(c,n))}return{c(){for(let t=0;t<s.length;t+=1)s[t].c();e=m()},m(t,o){for(let e=0;e<s.length;e+=1)s[e].m(t,o);l(t,e,o),n=!0},p(t,n){5&n&&(a=t[2].transactions.filter(t[9]),B(),s=W(s,n,r,1,t,a,o,e.parentNode,V,It,e,Dt),O())},i(t){if(!n){for(let t=0;t<a.length;t+=1)U(s[t]);n=!0}},o(t){for(let t=0;t<s.length;t+=1)P(s[t]);n=!1},d(t){for(let e=0;e<s.length;e+=1)s[e].d(t);t&&u(e)}}}function It(t,e){let n,s,o;return s=new St({props:{transaction:e[10]}}),{key:t,first:null,c(){n=m(),Y(s.$$.fragment),this.first=n},m(t,e){l(t,n,e),R(s,t,e),o=!0},p(t,n){e=t;const o={};5&n&&(o.transaction=e[10]),s.$set(o)},i(t){o||(U(s.$$.fragment,t),o=!0)},o(t){P(s.$$.fragment,t),o=!1},d(t){t&&u(n),Z(s,t)}}}function At(t){let e,n,s,o,a,r,c,m=(t[3].export_data||"Export Transaction Data")+"";return{c(){e=d("div"),n=d("button"),s=d("i"),o=p(),a=f(m),h(s,"class","fa-solid fa-file-export fa-fw"),h(n,"class","btn btn-green"),y(n,"display","flex"),y(n,"align-items","center"),y(n,"justify-content","center"),y(n,"gap","1rem"),h(e,"class","export-data svelte-b6c4h7")},m(u,d){var f;l(u,e,d),i(e,n),i(n,s),i(n,o),i(n,a),r||(c=g(n,"click",(f=t[4],function(t){return t.preventDefault(),f.call(this,t)})),r=!0)},p(t,e){8&e&&m!==(m=(t[3].export_data||"Export Transaction Data")+"")&&$(a,m)},d(t){t&&u(e),r=!1,c()}}}function qt(t){let e,n,s,o,a,r,c,f,m,v;const $=[Mt,Et],y=[];function b(t,e){return t[2]?0:1}a=b(t),r=y[a]=$[a](t);let _=!t[1]&&At(t);return{c(){e=d("section"),n=d("input"),s=p(),o=d("section"),r.c(),c=p(),_&&_.c(),h(n,"type","text"),h(n,"class","transactions-search svelte-b6c4h7"),h(n,"placeholder","Transaction Search (Message, TransID, Receiver)..."),h(o,"class","scroller"),h(e,"class","transactions-container svelte-b6c4h7")},m(r,u){l(r,e,u),i(e,n),w(n,t[0]),i(e,s),i(e,o),y[a].m(o,null),i(e,c),_&&_.m(e,null),f=!0,m||(v=g(n,"input",t[8]),m=!0)},p(t,[s]){1&s&&n.value!==t[0]&&w(n,t[0]);let c=a;a=b(t),a===c?y[a].p(t,s):(B(),P(y[c],1,1,(()=>{y[c]=null})),O(),r=y[a],r?r.p(t,s):(r=y[a]=$[a](t),r.c()),U(r,1),r.m(o,null)),t[1]?_&&(_.d(1),_=null):_?_.p(t,s):(_=At(t),_.c(),_.m(e,null))},i(t){f||(U(r),f=!0)},o(t){P(r),f=!1},d(t){t&&u(e),y[a].d(),_&&_.d(),m=!1,v()}}}function Bt(t,e,n){let s,o,a,c;r(t,ot,(t=>n(5,o=t))),r(t,ct,(t=>n(6,a=t))),r(t,it,(t=>n(3,c=t)));let i,l="";at.subscribe((t=>{n(1,i=t)}));return t.$$.update=()=>{96&t.$$.dirty&&n(2,s=a.find((t=>o===t.id)))},[l,i,s,c,function(){if(null==s&&console.log("No account selected"),0===s.transactions.length)return st.set("No transactions to export!"),void setTimeout((()=>{st.set("")}),3500);(t=>{const e=document.createElement("input");e.value=t,document.body.appendChild(e),e.select(),document.execCommand("copy"),document.body.removeChild(e)})((t=>{const e=Object.keys(t[0]),n=function(t,e){return null===e?"":e};let s=t.map((function(t){return e.map((function(e){return JSON.stringify(t[e],n)})).join(",")}));return s.unshift(e.join(",")),s=s.join("\r\n"),s})(s.transactions)),st.set("Data copied to clipboard!"),setTimeout((()=>{st.set("")}),3500)},o,a,t=>t.message.toLowerCase().includes(l.toLowerCase())||t.trans_id.toLowerCase().includes(l.toLowerCase())||t.receiver.toLowerCase().includes(l.toLowerCase()),function(){l=this.value,n(0,l)},t=>t.message.toLowerCase().includes(l.toLowerCase())||t.trans_id.toLowerCase().includes(l.toLowerCase())||t.receiver.toLowerCase().includes(l.toLowerCase())]}class Ot extends H{constructor(t){super(),X(this,t,Bt,qt,a,{})}}function Ut(t){let e,n,s,o,a,r,c,m,g,v,w=dt(t[0][0].cash)+"";return s=new Lt({}),a=new Ot({}),{c(){e=d("div"),n=d("section"),Y(s.$$.fragment),o=p(),Y(a.$$.fragment),r=p(),c=d("h5"),m=d("i"),g=f(w),h(n,"class","svelte-2qg4bz"),h(m,"class","fa-solid fa-wallet fa-fw"),h(c,"class","svelte-2qg4bz"),h(e,"class","main svelte-2qg4bz")},m(t,u){l(t,e,u),i(e,n),R(s,n,null),i(n,o),R(a,n,null),i(e,r),i(e,c),i(c,m),i(c,g),v=!0},p(t,[e]){(!v||1&e)&&w!==(w=dt(t[0][0].cash)+"")&&$(g,w)},i(t){v||(U(s.$$.fragment,t),U(a.$$.fragment,t),v=!0)},o(t){P(s.$$.fragment,t),P(a.$$.fragment,t),v=!1},d(t){t&&u(e),Z(s),Z(a)}}}function Pt(t,e,n){let s;return r(t,ct,(t=>n(0,s=t))),[s]}class Vt extends H{constructor(t){super(),X(this,t,Pt,Ut,a,{})}}function Wt(t){let e,n,s,o,a,r,c,m=(t[4].transfer||"State ID")+"";return{c(){e=d("div"),n=d("label"),s=f(m),o=p(),a=d("input"),h(n,"for","stateId"),h(n,"class","svelte-716t8p"),h(a,"type","text"),h(a,"name","stateId"),h(a,"id","stateId"),h(a,"placeholder","#"),h(a,"class","svelte-716t8p"),h(e,"class","form-row svelte-716t8p")},m(u,d){l(u,e,d),i(e,n),i(n,s),i(e,o),i(e,a),w(a,t[2]),r||(c=g(a,"input",t[11]),r=!0)},p(t,e){16&e&&m!==(m=(t[4].transfer||"State ID")+"")&&$(s,m),4&e&&a.value!==t[2]&&w(a,t[2])},d(t){t&&u(e),r=!1,c()}}}function Yt(e){let n,o,a,r,c,m,y,b,_,x,k,F,C,L,j,T,S,D,E,M,z,N,I,A,q,B,O,U,P,V,W,Y=e[3].account.type+"",R=(e[4].account||"Account")+"",Z=e[3].account.id+"",J=(e[4].amount||"Amount")+"",X=(e[4].comment||"Comment")+"",H=(e[4].cancel||"Cancel")+"",G=(e[4].confirm||"Confirm")+"",Q="transfer"===e[3].actionType&&Wt(e);return{c(){n=d("section"),o=d("section"),a=d("h2"),r=f(Y),c=p(),m=f(R),y=f(" / "),b=f(Z),_=p(),x=d("form"),k=d("div"),F=d("label"),C=f(J),L=p(),j=d("input"),T=p(),S=d("div"),D=d("label"),E=f(X),M=p(),z=d("input"),N=p(),Q&&Q.c(),I=p(),A=d("div"),q=d("button"),B=f(H),O=p(),U=d("button"),P=f(G),h(a,"class","svelte-716t8p"),h(F,"for","amount"),h(F,"class","svelte-716t8p"),h(j,"type","number"),h(j,"name","amount"),h(j,"id","amount"),h(j,"placeholder","$"),h(j,"class","svelte-716t8p"),h(k,"class","form-row svelte-716t8p"),h(D,"for","comment"),h(D,"class","svelte-716t8p"),h(z,"type","text"),h(z,"name","comment"),h(z,"id","comment"),h(z,"placeholder","//"),h(z,"class","svelte-716t8p"),h(S,"class","form-row svelte-716t8p"),h(q,"type","button"),h(q,"class","btn btn-orange"),h(U,"type","button"),h(U,"class","btn btn-green"),h(A,"class","btns-group"),h(x,"action","#"),h(o,"class","popup-content svelte-716t8p"),h(n,"class","popup-container svelte-716t8p")},m(t,s){l(t,n,s),i(n,o),i(o,a),i(a,r),i(a,c),i(a,m),i(a,y),i(a,b),i(o,_),i(o,x),i(x,k),i(k,F),i(F,C),i(k,L),i(k,j),w(j,e[0]),i(x,T),i(x,S),i(S,D),i(D,E),i(S,M),i(S,z),w(z,e[1]),i(x,N),Q&&Q.m(x,null),i(x,I),i(x,A),i(A,q),i(q,B),i(A,O),i(A,U),i(U,P),V||(W=[g(j,"input",e[9]),g(z,"input",e[10]),g(q,"click",e[5]),g(U,"click",e[12])],V=!0)},p(t,[e]){8&e&&Y!==(Y=t[3].account.type+"")&&$(r,Y),16&e&&R!==(R=(t[4].account||"Account")+"")&&$(m,R),8&e&&Z!==(Z=t[3].account.id+"")&&$(b,Z),16&e&&J!==(J=(t[4].amount||"Amount")+"")&&$(C,J),1&e&&v(j.value)!==t[0]&&w(j,t[0]),16&e&&X!==(X=(t[4].comment||"Comment")+"")&&$(E,X),2&e&&z.value!==t[1]&&w(z,t[1]),"transfer"===t[3].actionType?Q?Q.p(t,e):(Q=Wt(t),Q.c(),Q.m(x,I)):Q&&(Q.d(1),Q=null),16&e&&H!==(H=(t[4].cancel||"Cancel")+"")&&$(B,H),16&e&&G!==(G=(t[4].confirm||"Confirm")+"")&&$(P,G)},i:t,o:t,d(t){t&&u(n),Q&&Q.d(),V=!1,s(W)}}}function Rt(t,e,n){let s,o,a,c;r(t,rt,(t=>n(3,s=t))),r(t,ot,(t=>n(7,o=t))),r(t,ct,(t=>n(8,a=t))),r(t,it,(t=>n(4,c=t)));let i=0,l="",u="";function d(){rt.update((t=>Object.assign(Object.assign({},t),{actionType:""})))}function f(){nt.set(!0),Q(s.actionType,{fromAccount:s.account.id,amount:i,comment:l,stateid:u}).then((t=>{setTimeout((()=>{!1!==t&&ct.set(t),nt.set(!1)}),1e3)})),d()}return t.$$.update=()=>{384&t.$$.dirty&&a.find((t=>o===t.id))},[i,l,u,s,c,d,f,o,a,function(){i=v(this.value),n(0,i)},function(){l=this.value,n(1,l)},function(){u=this.value,n(2,u)},()=>f()]}class Zt extends H{constructor(t){super(),X(this,t,Rt,Yt,a,{})}}function Jt(e){let n;return{c(){n=d("section"),n.innerHTML='<section class="loading-content svelte-13vfl4f"><div class="loading-spinner svelte-13vfl4f"><div class="svelte-13vfl4f"></div> \n      <div class="svelte-13vfl4f"></div> \n      <div class="svelte-13vfl4f"></div> \n      <div class="svelte-13vfl4f"></div> \n      <div class="svelte-13vfl4f"></div> \n      <div class="svelte-13vfl4f"></div> \n      <div class="svelte-13vfl4f"></div> \n      <div class="svelte-13vfl4f"></div> \n      <div class="svelte-13vfl4f"></div> \n      <div class="svelte-13vfl4f"></div> \n      <div class="svelte-13vfl4f"></div> \n      <div class="svelte-13vfl4f"></div></div></section>',h(n,"class","loading-container svelte-13vfl4f")},m(t,e){l(t,n,e)},p:t,i:t,o:t,d(t){t&&u(n)}}}class Xt extends H{constructor(t){super(),X(this,t,null,Jt,a,{})}}function Ht(e){let n,s,o,a,r,c;return{c(){n=d("section"),s=d("section"),o=d("i"),a=p(),r=d("strong"),c=f(e[0]),h(o,"class","start-icon fa fa-info-circle faa-shake animated fa-2x"),h(r,"class","font__weight-bold"),y(r,"font-size","0.69vw"),h(s,"class","notificaion-content svelte-gab4hu"),h(n,"class","notificaion-container svelte-gab4hu")},m(t,e){l(t,n,e),i(n,s),i(s,o),i(s,a),i(s,r),i(r,c)},p(t,[e]){1&e&&$(c,t[0])},i:t,o:t,d(t){t&&u(n)}}}function Gt(t,e,n){let s;return r(t,st,(t=>n(0,s=t))),[s]}class Qt extends H{constructor(t){super(),X(this,t,Gt,Ht,a,{})}}function Kt(t){let e,n;return e=new Zt({}),{c(){Y(e.$$.fragment)},m(t,s){R(e,t,s),n=!0},i(t){n||(U(e.$$.fragment,t),n=!0)},o(t){P(e.$$.fragment,t),n=!1},d(t){Z(e,t)}}}function te(t){let e,n;return e=new Qt({}),{c(){Y(e.$$.fragment)},m(t,s){R(e,t,s),n=!0},i(t){n||(U(e.$$.fragment,t),n=!0)},o(t){P(e.$$.fragment,t),n=!1},d(t){Z(e,t)}}}function ee(t){let e,n,s,o,a;e=new Vt({});let r=""!==t[0].actionType&&Kt(),c=""!==t[1]&&te();return{c(){Y(e.$$.fragment),n=p(),r&&r.c(),s=p(),c&&c.c(),o=m()},m(t,i){R(e,t,i),l(t,n,i),r&&r.m(t,i),l(t,s,i),c&&c.m(t,i),l(t,o,i),a=!0},p(t,e){""!==t[0].actionType?r?1&e&&U(r,1):(r=Kt(),r.c(),U(r,1),r.m(s.parentNode,s)):r&&(B(),P(r,1,1,(()=>{r=null})),O()),""!==t[1]?c?2&e&&U(c,1):(c=te(),c.c(),U(c,1),c.m(o.parentNode,o)):c&&(B(),P(c,1,1,(()=>{c=null})),O())},i(t){a||(U(e.$$.fragment,t),U(r),U(c),a=!0)},o(t){P(e.$$.fragment,t),P(r),P(c),a=!1},d(t){Z(e,t),t&&u(n),r&&r.d(t),t&&u(s),c&&c.d(t),t&&u(o)}}}function ne(t){let e,n;return e=new Xt({}),{c(){Y(e.$$.fragment)},m(t,s){R(e,t,s),n=!0},i(t){n||(U(e.$$.fragment,t),n=!0)},o(t){P(e.$$.fragment,t),n=!1},d(t){Z(e,t)}}}function se(t){let e,n,s,o,a,r;s=new gt({props:{$$slots:{default:[ee]},$$scope:{ctx:t}}});let c=t[2]&&ne();return{c(){e=d("link"),n=p(),Y(s.$$.fragment),o=p(),c&&c.c(),a=m(),h(e,"rel","stylesheet"),h(e,"href","https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"),h(e,"integrity","sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="),h(e,"crossorigin","anonymous"),h(e,"referrerpolicy","no-referrer")},m(t,u){i(document.head,e),l(t,n,u),R(s,t,u),l(t,o,u),c&&c.m(t,u),l(t,a,u),r=!0},p(t,[e]){const n={};11&e&&(n.$$scope={dirty:e,ctx:t}),s.$set(n),t[2]?c?4&e&&U(c,1):(c=ne(),c.c(),U(c,1),c.m(a.parentNode,a)):c&&(B(),P(c,1,1,(()=>{c=null})),O())},i(t){r||(U(s.$$.fragment,t),U(c),r=!0)},o(t){P(s.$$.fragment,t),P(c),r=!1},d(t){u(e),t&&u(n),Z(s,t),t&&u(o),c&&c.d(t),t&&u(a)}}}function oe(t,e,n){let s,o,a;return r(t,rt,(t=>n(0,s=t))),r(t,st,(t=>n(1,o=t))),r(t,nt,(t=>n(2,a=t))),((t,e=1e3)=>{if(ut())for(const n of t)setTimeout((()=>{window.dispatchEvent(new MessageEvent("message",{data:{action:n.action,data:n.data}}))}),e)})([{action:"setVisible",data:{accounts:[{id:"FFFFF08",name:"Qwade Bot",amount:12e4,cash:1e4,transactions:[{trans_id:0,title:"Meth Dealing",trans_type:"withdraw",receiver:"qwade",amount:1e3,time:"12:30",issuer:"bank",message:"Im a fiend"},{trans_id:1,title:"Meth Dealing",trans_type:"deposit",receiver:"qwade",amount:1e3,time:"12:30",issuer:"bank",message:"Im a fiend"},{trans_id:2,title:"Dog Sitting",trans_type:"deposit",receiver:"qwade",amount:150,time:"12:30",issuer:"bank",message:"doggos"},{trans_id:3,title:"Dog Sitting",trans_type:"deposit",receiver:"qwade",amount:150,time:"12:30",issuer:"bank",message:"doggos"},{trans_id:4,title:"Dog Sitting",trans_type:"deposit",receiver:"qwade",amount:150,time:"12:30",issuer:"bank",message:"doggos"}],type:"Personal",isFrozen:!1},{id:"FFFdFSD",name:"Law Enforcement",amount:1e3,cash:1e4,transactions:[{trans_id:0,title:"Meth Dealing 2",trans_type:"withdraw",receiver:"qwadebot",amount:1e3,time:"12:30",issuer:"bank",message:"Im a fiend 2"}],type:"Business",isFrozen:!1},{id:"FFsFFSD",name:"Law Enforcement",amount:1e3,cash:1e4,transactions:[{trans_id:0,title:"Meth Dealing 2",trans_type:"withdraw",receiver:"qwadebot",amount:1e3,time:"12:30",issuer:"bank",message:"Im a fiend 2"}],type:"Business",isFrozen:!1},{id:"FFsFddFSD",name:"Law Enforcement",amount:1e3,cash:1e4,transactions:[{trans_id:0,title:"Meth Dealing 2",trans_type:"withdraw",receiver:"qwadebot",amount:1e3,time:"12:30",issuer:"bank",message:"Im a fiend 2"}],type:"Business",isFrozen:!1},{id:"FFFaFSD",name:"Law Enforcement",amount:1e3,cash:1e4,transactions:[{trans_id:0,title:"Meth Dealing 2",trans_type:"withdraw",receiver:"qwadebot",amount:1e3,time:"12:30",issuer:"bank",message:"Im a fiend 2"}],type:"Business",isFrozen:!1}],status:!0,loading:!1,atm:!1}}]),[s,o,a]}return new class extends H{constructor(t){super(),X(this,t,oe,se,a,{})}}({target:document.body})}();
//# sourceMappingURL=bundle.js.map
