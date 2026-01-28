import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root',
})
export class ApiService {
 
  baseUrl = '/api';

  constructor(private http: HttpClient) {}

  // GET all books
  getBooks() {
    return this.http.get<any>(`${this.baseUrl}/allBooks`);
  }

  // ADD book
  postBook(data: any) {
    return this.http.post<any>(`${this.baseUrl}/addBook`, data);
  }

  // UPDATE book
  putBook(data: any, bookId: number) {
    return this.http.put<any>(`${this.baseUrl}/updateBook/${bookId}`, data);
  }

  // DELETE book
  deleteBook(bookId: number) {
    return this.http.delete<any>(`${this.baseUrl}/deleteBook/${bookId}`);
  }
}


