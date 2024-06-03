from typing import Any, Dict

from kitty.typing import BossType
from kitty.window import Window


def on_focus_change(boss: BossType, window: 'Window', data: Dict[str, Any]) -> None:
    if data.get('focused'):
        window.set_marker('regex 1 (ERROR|NOK) 2 (SUCCESS|OK) 3 (WARNING)')
    else:
        window.remove_marker()
