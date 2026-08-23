package menu
{
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class ContextMenu extends Sprite
   {
      
      private var items:Array = [];
      
      private var _width:int;
      
      protected var §_-jR§:int;
      
      public function ContextMenu(param1:int)
      {
         super();
         this.visible = false;
         this._width = param1;
         this.init();
      }
      
      public function add(param1:Object) : ContextMenuItem
      {
         var _loc2_:ContextMenuItem = new ContextMenuItem(param1["name"],this._width - 2,param1["active"],param1["passive"]);
         _loc2_.x = 2;
         _loc2_.addEventListener(§_-r13§.§_-n2H§,this.§_-23k§);
         _loc2_.addEventListener(§_-r13§.§_-n2H§,param1["handler"]);
         addChild(_loc2_);
         this.items.push(_loc2_);
         return _loc2_;
      }
      
      public function update(param1:int = 42) : void
      {
         var _loc3_:ContextMenuItem = null;
         this.§_-jR§ = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.items.length)
         {
            _loc3_ = this.items[_loc2_];
            _loc3_.y = 0;
            if(_loc3_.visible)
            {
               _loc3_.y = param1;
               param1 += _loc3_.height;
               ++this.§_-jR§;
            }
            _loc2_++;
         }
      }
      
      protected function show(param1:MouseEvent) : void
      {
         Game.§_-q1L§.addChild(this);
         this.visible = true;
         var _loc2_:Point = Game.§_-q1L§.globalToLocal(new Point(Game.stage.mouseX,Game.stage.mouseY));
         this.x = _loc2_.x;
         this.y = _loc2_.y + 20;
         if(this.x + this.width > §_-Zy§.§_-21V§)
         {
            this.x = _loc2_.x - this.width;
         }
         if(this.y + this.height > §_-Zy§.§_-02T§)
         {
            this.y = _loc2_.y - this.height;
         }
      }
      
      private function init() : void
      {
         Game.stage.addEventListener(MouseEvent.MOUSE_DOWN,this.click);
      }
      
      private function click(param1:MouseEvent) : void
      {
         if(!Game || !Game.§_-q1L§)
         {
            return;
         }
         var _loc2_:Point = Game.§_-q1L§.globalToLocal(new Point(param1.stageX,param1.stageY));
         if(_loc2_.x >= this.x && _loc2_.x <= this.x + this.width && _loc2_.y + 20 >= this.y && _loc2_.y <= this.y + this.height)
         {
            return;
         }
         this.visible = false;
      }
      
      private function §_-23k§(param1:§_-r13§) : void
      {
         this.visible = false;
      }
   }
}

