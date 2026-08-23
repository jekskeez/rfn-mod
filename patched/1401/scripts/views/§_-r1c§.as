package views
{
   import §_-f1x§.§_-Z1s§;
   import §_-f1x§.§_-t3§;
   import com.api.Player;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class §_-r1c§ extends Sprite
   {
      
      private var player:Player = null;
      
      private var elements:Array = [];
      
      private var §_-82q§:§_-t3§ = null;
      
      public function §_-r1c§(param1:Boolean)
      {
         super();
         this.init(param1);
      }
      
      public function §_-031§(param1:Player, param2:int) : void
      {
         this.player = param1;
         if(this.player == null || !("collection_exchange" in this.player))
         {
            return;
         }
         var _loc3_:Array = this.player["collection_exchange"];
         if(!_loc3_ || _loc3_.length == 0)
         {
            return;
         }
         this.§_-82q§ = null;
         var _loc4_:int = 0;
         while(_loc4_ < this.elements.length)
         {
            (this.elements[_loc4_] as §_-t3§).level = param2;
            (this.elements[_loc4_] as §_-t3§).id = _loc4_ < _loc3_.length ? int(_loc3_[_loc4_]) : -1;
            _loc4_++;
         }
      }
      
      public function get §_-z2f§() : int
      {
         return this.§_-82q§ != null ? this.§_-82q§.elementId : -1;
      }
      
      private function init(param1:Boolean) : void
      {
         var _loc3_:§_-t3§ = null;
         this.graphics.beginFill(14535087);
         this.graphics.drawRoundRect(param1 ? 0 : 136,0,param1 ? 625 : 489,55,5,5);
         var _loc2_:int = 0;
         while(_loc2_ < §_-Z1s§.§_-k2d§)
         {
            _loc3_ = new §_-t3§();
            _loc3_.id = -1;
            _loc3_.x = 150 + _loc2_ * 52;
            _loc3_.y = 5;
            _loc3_.addEventListener(MouseEvent.CLICK,this.select);
            addChild(_loc3_);
            this.elements.push(_loc3_);
            _loc2_++;
         }
         if(param1)
         {
            addChild(new §_-22V§(gls("Коллекции\nна обмен"),20,6,new TextFormat(§_-22V§.§_-pJ§,16,16777215,true,null,null,null,null,"center")));
         }
      }
      
      private function select(param1:MouseEvent) : void
      {
         if(this.§_-82q§)
         {
            this.§_-82q§.sticked = false;
         }
         this.§_-82q§ = this.§_-82q§ == param1.currentTarget ? null : param1.currentTarget as §_-t3§;
         dispatchEvent(new Event(Event.CHANGE));
      }
   }
}

