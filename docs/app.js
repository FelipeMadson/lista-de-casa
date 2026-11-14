const list = document.querySelector('#items');
const form = document.querySelector('#form');
const input = document.querySelector('#item');
const count = document.querySelector('#count');
const empty = document.querySelector('#empty');
const key = 'lista-de-casa-demo-v1';
let items;
try { const saved = JSON.parse(localStorage.getItem(key)); items = Array.isArray(saved) ? saved.filter(i => typeof i?.name === 'string' && typeof i?.done === 'boolean') : null; } catch { items = null; }
items ??= [{name:'Café',done:false},{name:'Leite',done:false},{name:'Maçãs',done:true}];
function render() {
  list.replaceChildren();
  for (const [index, item] of items.entries()) {
    const li = document.createElement('li'); li.classList.toggle('done', item.done);
    const check = document.createElement('input'); check.type = 'checkbox'; check.checked = item.done; check.id = `item-${index}`;
    check.addEventListener('change', () => { item.done = check.checked; save(); });
    const label = document.createElement('label'); label.htmlFor = check.id; label.textContent = item.name;
    const remove = document.createElement('button'); remove.type = 'button'; remove.className = 'remove'; remove.textContent = '×'; remove.setAttribute('aria-label', `Remover ${item.name}`);
    remove.addEventListener('click', () => { items.splice(index, 1); save(); });
    li.append(check, label, remove); list.append(li);
  }
  const pending = items.filter(item => !item.done).length;
  count.textContent = `${pending} ${pending === 1 ? 'pendente' : 'pendentes'}`;
  empty.hidden = items.length > 0;
}
function save() { try { localStorage.setItem(key, JSON.stringify(items)); } catch {} render(); }
form.addEventListener('submit', event => { event.preventDefault(); const name = input.value.trim(); if (!name) { input.focus(); return; } items.push({name,done:false}); input.value = ''; save(); input.focus(); });
render();
