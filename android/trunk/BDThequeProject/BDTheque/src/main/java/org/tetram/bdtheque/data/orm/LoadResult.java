package org.tetram.bdtheque.data.orm;

public enum LoadResult {
    /**
     * L'entit� a �t� charg�e
     */
    OK,
    /**
     * L'entit� contient des annotations @Field mais le curseur ne contient pas d'enregistrement � charger
     */
    NOTFOUND,
    /**
     * l'entit� n'utilise pas les annotations @Field
     */
    ERROR
}