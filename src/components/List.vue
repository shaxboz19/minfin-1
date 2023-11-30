<template>
  <ul class="file-system">
    <li
      v-for="item in items"
      :key="item.id"
      class="file-system-node"
      :class="{ active: item.isActive }"
    >
      <div @click="toggleActive(item)">
        <i
          v-if="item.children"
          class="icon folder fa"
          :class="{
            'fa-folder': true,
            'fa-folder-open': item.isActive,
          }"
        ></i>
        <i v-else class="icon file fa fa-file"></i>
        <span>{{ item.name }}</span>
      </div>
      <List
        v-if="item.children"
        :items="item.children"
        :parentIsActive="item.isActive"
      ></List>
    </li>
  </ul>
</template>
  
  <script>
export default {
  name: 'List',
  props: {
    items: {
      type: Array,
      required: true,
    },
    parentIsActive: {
      type: Boolean,
      default: false,
    },
  },
  methods: {
    toggleActive(item) {
      if (!item.children) {
        return;
      } else {
        item.isActive = !item.isActive;
        this.toggleChildrenWithChildren(item.children, item.isActive);
      }
    },
    toggleChildrenWithChildren(children, status) {
      children.forEach((child) => {
        if (child.children) {
          this.toggleChildrenWithChildren(child.children, status);
          child.isActive = status;
        }
      });
    },
  },
};
</script>
  
  <style scoped>
.file-system {
  list-style-type: none;
  padding-left: 1em;
}

.file-system-node {
  cursor: pointer;
  margin-bottom: 5px;
}

.file-system-node > div {
  display: flex;
  align-items: center;
  cursor: pointer;
}

.icon {
  margin-right: 5px;
}

.icon.folder {
  color: #007bff;
}

.icon.folder.fa-open {
  transform: rotate(90deg);
}

.file-system-node > .file-system {
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.3s linear;
}

.file-system-node.active > .file-system {
  max-height: 500px;
}
</style>
  