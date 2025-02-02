ZMan =
{
	Jobs = { },

	GetJobs = function()
		return ZMan.Jobs or { }
	end,

	GetJob = function(job)
		if ZMan.Jobs[job] == nil then
			return Utils.Logger.Error(("Job (%s) is not a valid job! (Does not exist in Job table)"):format(job))
		end
	end,

	RegisterJob = function(job, data)
		if ZMan.Jobs[job] ~= nil then
			return Utils.Logger.Error(("Job (%s) already exists in our Jobs table!"):format(job))
		end

		if data and data.label and data.grades and #data.grades > 0 then
			ZMan.Jobs[job] = data
			Utils.Logger.Debug(("Added job (%s) to the Job list!"):format(job))
			-- Add to database
		else
			Utils.Logger.Error(('Cannot add job %s because it has invalid options!'):format(job))
		end
	end
}