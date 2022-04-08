using System.Collections.Generic;
using System.Data;
using System.Linq;
using daPlanets.Models;
using Dapper;

namespace daPlanets.Repositories
{
  public class SpeciesRepository
  {
    private readonly IDbConnection _db;

    public SpeciesRepository(IDbConnection db)
    {
      _db = db;
    }

    public List<PlanetSpeciesViewModel> GetSpeciesByPlanet(int planetId)
    {
      string sql = @"
          SELECT 
          s.id AS speciesId,
          s.name,
          s.dangerlevel
          FROM planetspecies ps
          JOIN species s on s.id = ps.speciesId
          JOIN planets p on p.id = ps.planetId
          WHERE ps.planetId = @id;";
      return _db.Query<PlanetSpeciesViewModel>(sql, new
      {
        planetId
      }).ToList();
    }
  }
}