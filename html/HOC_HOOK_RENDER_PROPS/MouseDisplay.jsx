const { useState, useEffect } = React;

const Styles = {
    redBorder: {
        border: '1px solid #f00',
    },
};

const MouseDisplay = ({ x, y }) => {
    return (
        <div>
            Mouse at x: {x} ; y: {y}
        </div>
    );
};
const MouseDisplay2 = ({ x, y }) => {
    return (
        <div style={{ color: 'teal' }}>
            Mouse at x: {x} ; y: {y}
        </div>
    );
};

// Normal
export const MouseInfoAndDisplay = () => {
    const [x, setX] = useState(0);
    const [y, setY] = useState(0);
    const handleMove = (e) => {
        setX(e.clientX);
        setY(e.clientY);
    };
    return (
        <div style={Styles.redBorder} onMouseMove={handleMove}>
            <MouseDisplay x={x} y={y} />
        </div>
    );
};

// HOC
const withMouseInfo = (Component) => {
    return (props) => {
        const [x, setX] = useState(0);
        const [y, setY] = useState(0);
        const handleMove = (e) => {
            setX(e.clientX);
            setY(e.clientY);
        };
        return (
            <div style={Styles.redBorder} onMouseMove={handleMove}>
                <Component {...props} x={x} y={y} />
            </div>
        );
    };
};

export const HOCMouseDisplay = withMouseInfo(MouseDisplay);
export const HOCMouseDisplay2 = withMouseInfo(MouseDisplay2);

// Render Props

const MouseRenderProps = ({ render }) => {
    const [x, setX] = useState(0);
    const [y, setY] = useState(0);
    const handleMove = (e) => {
        setX(e.clientX);
        setY(e.clientY);
    };

    return (
        <div style={Styles.redBorder} onMouseMove={handleMove}>
            {render(x, y)}
        </div>
    );
};

export const Mouse = () => {
    return (
        <div>
            <MouseRenderProps render={(x, y) => <MouseDisplay x={x} y={y} />} />
            <MouseRenderProps
                render={(x, y) => <MouseDisplay2 x={x} y={y} />}
            />
        </div>
    );
};

// Customize HOOK

const useMouseState = () => {
    const [x, setX] = useState(0);
    const [y, setY] = useState(0);
    const [node, setNode] = useState(null);
    const handleMove = (e) => {
        setX(e.clientX);
        setY(e.clientY);
    };
    useEffect(() => {
        if (node !== null) {
            node.addEventListener('mousemove', handleMove);
        }
    }, [node]);
    return [x, y, setNode];
};

export const MouseUsingHook = () => {
    const [x1, y1, ref1] = useMouseState();
    const [x2, y2, ref2] = useMouseState();

    return (
        <div>
            <div ref={ref1} style={Styles.redBorder}>
                <MouseDisplay x={x1} y={y1} />
            </div>
            <div ref={ref2} style={Styles.redBorder}>
                <MouseDisplay2 x={x2} y={y2} />
            </div>
        </div>
    );
};
