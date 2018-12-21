function [] = VideoFrameCapture( input_folder, file_name, frame_ratio, output_path )
    vr = VideoReader(strcat(input_folder, '\', file_name));
    output_dir = strcat(output_path, '\', file_name, '_dir');
    mkdir(output_dir);
    frame_count = -1;
    while hasFrame(vr)
        frame = readFrame(vr);
        frame_count = frame_count + 1;
        if mod(frame_count, frame_ratio) == 0
            imwrite(frame, ...
                strcat(output_dir, ...
                '\', int2str(int32(frame_count/frame_ratio)), '.jpg'));
        end
        
        if mod(frame_count, frame_ratio * 1000) == 0
            disp(frame_count / (frame_ratio * 1000));
        end
    end
    disp('Total Frame Count:');
    disp(frame_count);
end

