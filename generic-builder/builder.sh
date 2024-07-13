# Environment Setup Phase
set -e
unset PATH
for p in ${baseInputs} ${buildInputs}; do
    export PATH=$p/bin${PATH:+:}$PATH
done

# Unpack Phase
tar -xf $src

# Change Directory Phase
for d in *; do
    if [ -d "$d" ]; then
        cd "$d"
        break
    fi
done

# Configure Phase
./configure --prefix=$out

# Build Phase
make

# Install Phase
make install

# Fixup Phase
find $out -type f -exec patchelf --shrink-rpath '{}' \; -exec strip '{}' \; 2>/dev/null
