//TEST(smoke,compute):COMPARE_COMPUTE: -shaderobj -Xslang... -Wno-unrecommended-implicit-conversion -X.
//TEST(smoke,compute):COMPARE_COMPUTE:-cpu -shaderobj -Xslang... -Wno-unrecommended-implicit-conversion -X.

// Test to check warning disable

//TEST_INPUT:ubuffer(data=[0 0 0 0], stride=4):out,name=outputBuffer
RWStructuredBuffer<uint> outputBuffer;

[numthreads(4, 1, 1)]
void computeMain(uint3 dispatchThreadID : SV_DispatchThreadID)
{
    uint v = dispatchThreadID.x;
    // This coercion loses data and would normally produce a warning
    int v1 = v;
    
    outputBuffer[dispatchThreadID.x] = v1;
}