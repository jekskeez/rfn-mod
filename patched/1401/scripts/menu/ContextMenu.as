package menu
{
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class ContextMenu extends Sprite
   {
      
      private var items:Array = [];
      
      private var _width:int;
      
      protected var §_-Dw§:int;
      
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
         _loc2_.addEventListener(§_-Yo§.§_-31q§,this.§_-f2C§);
         _loc2_.addEventListener(§_-Yo§.§_-31q§,param1["handler"]);
         addChild(_loc2_);
         this.items.push(_loc2_);
         return _loc2_;
      }
      
      public function update(param1:int = 42) : void
      {
         var _loc3_:ContextMenuItem = null;
         this.§_-Dw§ = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.items.length)
         {
            _loc3_ = this.items[_loc2_];
            _loc3_.y = 0;
            if(_loc3_.visible)
            {
               _loc3_.y = param1;
               param1 += _loc3_.height;
               ++this.§_-Dw§;
            }
            _loc2_++;
         }
      }
      
      protected function show(param1:MouseEvent) : void
      {
         Game.§_-d2t§.addChild(this);
         this.visible = true;
         var _loc2_:Point = Game.§_-d2t§.globalToLocal(new Point(Game.stage.mouseX,Game.stage.mouseY));
         this.x = _loc2_.x;
         this.y = _loc2_.y + 20;
         if(this.x + this.width > §_-a9§.§_-9o§)
         {
            this.x = _loc2_.x - this.width;
         }
         if(this.y + this.height > §_-a9§.§_-31m§)
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
         if(!Game || !Game.§_-d2t§)
         {
            return;
         }
         var _loc2_:Point = Game.§_-d2t§.globalToLocal(new Point(param1.stageX,param1.stageY));
         if(_loc2_.x >= this.x && _loc2_.x <= this.x + this.width && _loc2_.y + 20 >= this.y && _loc2_.y <= this.y + this.height)
         {
            return;
         }
         this.visible = false;
      }
      
      private function §_-f2C§(param1:§_-Yo§) : void
      {
         this.visible = false;
      }
   }
}

