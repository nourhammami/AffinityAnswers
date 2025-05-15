-- Count of tiger types
SELECT COUNT(*) AS tiger_types_count
FROM taxonomy
WHERE species LIKE '%tiger%';

-- ncbi_id of Sumatran Tiger
SELECT ncbi_id
FROM taxonomy
WHERE species LIKE '%sumatran tiger%';

1. `family.rfam_acc` ↔ `clan_membership.rfam_acc`
2. `family.rfam_acc` ↔ `full_region.rfam_acc`
3. `rfamseq.rfamseq_acc` ↔ `full_region.rfamseq_acc`
4. `taxonomy.ncbi_id` ↔ `rfamseq.ncbi_id`
5. `clan.clan_acc` ↔ `clan_membership.clan_acc`

SELECT t.species, r.length
FROM rfamseq r
JOIN taxonomy t ON r.ncbi_id = t.ncbi_id
WHERE t.species LIKE '%rice%'
ORDER BY r.length DESC
LIMIT 1;

SELECT f.rfam_acc, f.description AS family_name, MAX(r.length) AS max_sequence_length
FROM family f
JOIN full_region fr ON f.rfam_acc = fr.rfam_acc
JOIN rfamseq r ON fr.rfamseq_acc = r.rfamseq_acc
GROUP BY f.rfam_acc, f.description
HAVING MAX(r.length) > 1000000
ORDER BY max_sequence_length DESC
LIMIT 15 OFFSET 120; 
