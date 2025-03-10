/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;

/**
 *
 * @author tungi
 */
public interface IDAO<T, K> {
    public boolean create(T entity);
    public List<T> readAll();
    public T readByID(K id);
    public boolean update(T entity);
    public boolean delete(K id);
    public List<T> search(String searchTerm);
}