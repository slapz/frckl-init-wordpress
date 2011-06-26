<form method="get" action="<?php echo home_url(); ?>/">
  <label for="s">Suche</label>
  <input type="search" id="s" name="s" placeholder="Suchbegriffe" value="<?php the_search_query(); ?>">
  <input type="submit" value="Suchen">
</form>
