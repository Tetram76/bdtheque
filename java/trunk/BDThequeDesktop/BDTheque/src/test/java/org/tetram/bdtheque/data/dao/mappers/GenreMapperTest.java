package org.tetram.bdtheque.data.dao.mappers;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.tetram.bdtheque.SpringTest;
import org.tetram.bdtheque.data.Constants;
import org.tetram.bdtheque.data.bean.GenreLite;
import org.tetram.bdtheque.utils.StringUtils;

public class GenreMapperTest extends SpringTest {

    @Autowired
    private GenreMapper mapper;

    @Test
    public void testGetGenreLiteById() throws Exception {
        GenreLite genre = mapper.getGenreLiteById(Constants.ID_GENRE_AVENTURES);
        Assert.assertNotNull(genre);
        Assert.assertNotNull(genre.getId());
        Assert.assertNotNull(genre.getGenre());
    }

    @Test
    public void testGetListGenreBySerieId() throws Exception {

    }

    @Test
    public void testCreateGenre() throws Exception {
        int rowCount;

        GenreLite genre;
        genre = new GenreLite();
        genre.setGenre(Constants.TEST_CREATE);

        rowCount = mapper.createGenreLite(genre);
        Assert.assertEquals(1, rowCount);
        Assert.assertNotNull(genre.getId());
        Assert.assertNotEquals(StringUtils.GUID_NULL, genre.getId());

        genre = mapper.getGenreLiteById(genre.getId());
        Assert.assertEquals(Constants.TEST_CREATE, genre.getGenre());

        genre.setGenre(Constants.TEST_UPDATE);
        rowCount = mapper.updateGenreLite(genre);
        Assert.assertEquals(1, rowCount);

        genre = mapper.getGenreLiteById(genre.getId());
        Assert.assertEquals(Constants.TEST_UPDATE, genre.getGenre());

        rowCount = mapper.deleteGenreLite(genre.getId());
        Assert.assertEquals(1, rowCount);

        genre = mapper.getGenreLiteById(genre.getId());
        Assert.assertNull(genre);
    }
}