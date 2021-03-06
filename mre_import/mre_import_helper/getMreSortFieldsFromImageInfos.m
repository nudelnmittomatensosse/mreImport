function [ sortFields ] = getMreSortFieldsFromImageInfos( infos )
%GETSORTFIELDSFROMIMAGEINFOS Summary of this function goes here
%   Detailed explanation goes here


names=fieldnames(infos(1).mre);
for index=1:numel(infos)
    for fieldIndex=1:length(names)
        infos(index).(['mre_' names{fieldIndex}])=infos(index).mre.(names{fieldIndex});
    end
end


sortFields=struct();

%% Default case: whole cube was created from one measurement

sortFields.SliceLocation=[infos.SliceLocation];
sortFields.timeStepIndex=[infos.mre_timeStepIndex];
sortFields.dirIndex=[infos.mre_dirIndex];
sortFields.freqIndex=[infos.mre_freqIndex];
sortFields.sessIndex=zeros(1,numel(infos));

sortFields.SeriesInstanceUID={infos.SeriesInstanceUID};
% [b1, m1, n1] = unique(sortFields.SeriesInstanceUID, 'first');
% sortFields.sessIndex=n1;

sortFields.cycle=[infos.mre_mechCycleTime_us];




end

