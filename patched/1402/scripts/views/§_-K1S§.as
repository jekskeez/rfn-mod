package views
{
   import §_-S1n§.§_-kr§;
   import com.api.Player;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class §_-K1S§ extends §_-81K§
   {
      
      private var _selected:Boolean = false;
      
      private var §_-Ph§:SimpleButton;
      
      private var §_-h1S§:Boolean = false;
      
      private var §_-oj§:§_-kr§ = null;
      
      public function §_-K1S§(param1:DisplayObject)
      {
         super(param1);
         this.§_-Ph§ = new SetDecorationButton();
         this.§_-Ph§.x = 41;
         this.§_-Ph§.y = 36;
         this.§_-Ph§.addEventListener(MouseEvent.MOUSE_UP,this.§_-H1h§);
         addChild(this.§_-Ph§);
         this.§_-oj§ = new §_-kr§(this,"",true);
      }
      
      override public function §_-o2c§(param1:Player) : Boolean
      {
         if(super.§_-o2c§(param1))
         {
            return true;
         }
         if(Boolean(param1["is_gone"]) && this.§_-h1S§ != Boolean(param1["is_gone"]))
         {
            return true;
         }
         return false;
      }
      
      override public function §_-yC§(param1:Player) : void
      {
         super.§_-yC§(param1);
         this.§_-D2w§.visible = false;
         if("is_gone" in param1)
         {
            this.§_-h1S§ = param1["is_gone"] == 1;
         }
         this.§_-oj§.setStatus(param1["name"]);
      }
      
      override public function §_-H1h§(param1:MouseEvent) : void
      {
         this.selected = !this.selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
         this.§_-Ph§.visible = param1;
         dispatchEvent(new Event("TOGGLE_SELECTED"));
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
   }
}

