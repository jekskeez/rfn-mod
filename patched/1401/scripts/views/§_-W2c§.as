package views
{
   import §_-e1G§.§_-Hb§;
   import com.api.Player;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class §_-W2c§ extends §_-ho§
   {
      
      private var _selected:Boolean = false;
      
      private var §_-L2K§:SimpleButton;
      
      private var §_-z2V§:Boolean = false;
      
      private var §_-XW§:§_-Hb§ = null;
      
      public function §_-W2c§(param1:DisplayObject)
      {
         super(param1);
         this.§_-L2K§ = new SetDecorationButton();
         this.§_-L2K§.x = 41;
         this.§_-L2K§.y = 36;
         this.§_-L2K§.addEventListener(MouseEvent.MOUSE_UP,this.§_-P2v§);
         addChild(this.§_-L2K§);
         this.§_-XW§ = new §_-Hb§(this,"",true);
      }
      
      override public function §_-51I§(param1:Player) : Boolean
      {
         if(super.§_-51I§(param1))
         {
            return true;
         }
         if(Boolean(param1["is_gone"]) && this.§_-z2V§ != Boolean(param1["is_gone"]))
         {
            return true;
         }
         return false;
      }
      
      override public function §_-031§(param1:Player) : void
      {
         super.§_-031§(param1);
         this.§_-Qr§.visible = false;
         if("is_gone" in param1)
         {
            this.§_-z2V§ = param1["is_gone"] == 1;
         }
         this.§_-XW§.setStatus(param1["name"]);
      }
      
      override public function §_-P2v§(param1:MouseEvent) : void
      {
         this.selected = !this.selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
         this.§_-L2K§.visible = param1;
         dispatchEvent(new Event("TOGGLE_SELECTED"));
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
   }
}

