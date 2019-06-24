\c host_agent

SELECT		cpu_number,
		id,
		total_mem
FROM		host_info
ORDER BY	cpu_number, total_mem DESC;



SELECT	id,
	hostname,
	total_memory,
	ROUND(used_memory_percentage, 1)
FROM   (SELECT 		info.id,
			info.hostname,
			info.total_mem AS total_memory,
			AVG(((info.total_mem / 1000) - use.memory_free)/(info.total_mem/1000))
				OVER(	PARTITION BY info.id
					ORDER BY use.timestamp
					ROWS BETWEEN 4 PRECEDING AND CURRENT ROW)
				AS used_memory_percentage
	FROM		host_info info
	INNER JOIN	host_usage use
	ON		info.id = use.host_id
	) AS sub
ORDER BY id DESC;
