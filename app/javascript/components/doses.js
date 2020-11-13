import Sortable from 'sortablejs';

const initSortable = () => {
  const list = document.getElementById("doses");
  Sortable.create(list);
};

export { initSortable };