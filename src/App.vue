<template>
  <div class="menu">
    <List :items="list"></List>
  </div>
</template>

<script>
import List from './components/List.vue';

export default {
  components: {
    List,
  },
  data() {
    return {
      list: [
        {
          id: 1,
          name: 'Родитель 1',
          isActive: false,
          children: [
            { id: 2, name: 'Наследник 1', isActive: false },
            { id: 3, name: 'Наследник 2', isActive: false },
          ],
        },
        {
          id: 4,
          name: 'Родитель 2',
          isActive: false,
          children: [
            { id: 5, name: 'Наследник 3', isActive: false },
            {
              id: 6,
              name: 'Наследник 4',
              isActive: false,
              children: [
                { id: 7, name: 'Наследник 5', isActive: false },
                {
                  id: 8,
                  name: 'Наследник 6',
                  isActive: false,
                  children: [
                    { id: 9, name: 'Наследник 7', isActive: false },
                    { id: 10, name: 'Наследник 8', isActive: false },
                  ],
                },
              ],
            },
          ],
        },
      ],
    };
  },
};
</script>

<style>
.menu {
  display: inline-block;
}
</style>
