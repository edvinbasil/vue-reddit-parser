<template>
    <div class="media m-3">
      <img :src="post.data.thumbnail" class="mr-3" alt="">
      <div class="media-body">
        <a :href="makeLink(post.data.permalink)" target="_blank" rel="noreferrer noopener">
          <h5 class="mt-0">{{ post.data.title }}</h5>
        </a>
        <div class="badge badge-danger">{{ post.data.ups }} &#x2B06;</div>
        <div> {{ post.data.selftext }}</div>
      </div>
    </div>
</template>


<script>
export default {
  name: 'SinglePost',
  props: ['post'],
  methods: {
    makeLink(perm) {
      return `https://www.reddit.com${perm}`;
    },
  },
};
</script>

<style lang="scss">
</style>
