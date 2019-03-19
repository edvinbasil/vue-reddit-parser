<template>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Reddit Scraper</a>
    <div class="collapse navbar-collapse" id="navbarColor01">
      <ul class="navbar-nav mr-auto">
      </ul>
      <form @submit.prevent="fetchReddit(url)" class="form-inline my-2 my-lg-0">
        <input
          @input="$emit('input', $event.target.value)"
          :value="value" class="form-control mr-sm-2"
          type="text">
        <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
  </nav>
</template>

<script>
export default {
  name: 'NavBar',
  props: ['fetchReddit', 'url', 'value'],
};
</script>

<style scoped>

</style>
