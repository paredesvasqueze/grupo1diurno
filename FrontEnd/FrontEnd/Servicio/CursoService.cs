using FrontEnd.Models;

namespace FrontEnd.Servicio
{
    public class CursoService //: ICursoService
    { 
    
        private readonly HttpClient _httpClient;
        private readonly IConfiguration _configuration;
        string _baseURL = string.Empty;

        public CursoService(HttpClient httpClient, IConfiguration configuration)
        {
            _httpClient = httpClient;
            _configuration = configuration;
            _baseURL = _configuration["UrlBaseAPIs"];
            _httpClient.BaseAddress = new Uri(_baseURL);            
        }

        public async Task<IEnumerable<Curso>> GetCursosAsync(string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.GetAsync("api/curso_crud.php");
            response.EnsureSuccessStatusCode();
            return await response.Content.ReadFromJsonAsync<IEnumerable<Curso>>();
        }        

        public async Task<bool> CreateCursoAsync(Curso Curso, string token)
        {
          //  _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.PostAsJsonAsync("api/curso_crud.php", Curso);
            return response.IsSuccessStatusCode;
        }

        public async Task<bool> UpdateCursoAsync(Curso Curso, string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.PutAsJsonAsync("api/curso_crud.php", Curso);
            return response.IsSuccessStatusCode;
        }

        public async Task<bool> DeleteCursoAsync(int id, string token)
        {
            _httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var response = await _httpClient.DeleteAsync($"api/curso_crud.php?id={id}");
            return response.IsSuccessStatusCode;
        }


    }
}
