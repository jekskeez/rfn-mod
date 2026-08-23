package buttons
{
   import events.§_-b2G§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   
   public class §_-uH§ extends Sprite
   {
      
      protected var §_-13e§:DisplayObject;
      
      protected var §_-52L§:DisplayObject;
      
      protected var §_-p2h§:DisplayObject;
      
      protected var §_-82k§:DisplayObject;
      
      private var §_-22f§:DisplayObject;
      
      private var §_-l2P§:Boolean;
      
      private var §_-t28§:Boolean = false;
      
      public function §_-uH§(param1:DisplayObject, param2:DisplayObject = null, param3:DisplayObject = null, param4:DisplayObject = null, param5:DisplayObject = null, param6:Sprite = null)
      {
         var _loc7_:SimpleButton = null;
         super();
         this.buttonMode = true;
         this.mouseChildren = false;
         if(param1 is SimpleButton)
         {
            _loc7_ = param1 as SimpleButton;
            this.§_-13e§ = _loc7_.upState;
            this.§_-52L§ = _loc7_.overState;
            this.§_-82k§ = _loc7_.downState;
            this.§_-p2h§ = _loc7_.downState;
            this.§_-22f§ = _loc7_.upState;
            this.hitArea = param6 ? param6 : _loc7_.upState as Sprite;
         }
         else
         {
            this.§_-13e§ = param1;
            this.§_-52L§ = param2;
            this.§_-82k§ = param3;
            this.§_-p2h§ = param4 ? param4 : param3;
            this.§_-22f§ = param5;
            this.hitArea = param6;
         }
         this.init();
         this.sticked = false;
      }
      
      public function §_-C2G§(param1:SimpleButton) : void
      {
         removeChild(this.§_-13e§);
         removeChild(this.§_-52L§);
         removeChild(this.§_-82k§);
         this.§_-13e§ = param1.upState;
         this.§_-52L§ = param1.overState;
         this.§_-82k§ = param1.downState;
         this.§_-p2h§ = param1.downState;
         addChildAt(this.§_-13e§,0);
         addChildAt(this.§_-52L§,0);
         addChildAt(this.§_-82k§,0);
         this.sticked = this.sticked;
      }
      
      public function set sticked(param1:Boolean) : void
      {
         this.§_-L15§();
         if(param1)
         {
            this.§_-aw§();
         }
         else
         {
            this.§_-5U§();
         }
         this.§_-l2P§ = param1;
      }
      
      public function set block(param1:Boolean) : void
      {
         if(param1 == this.block)
         {
            return;
         }
         this.§_-L15§();
         if(param1)
         {
            this.play(this.§_-22f§);
         }
         else
         {
            this.play(this.§_-13e§);
         }
         if(!param1 && this.§_-t28§)
         {
            addEventListener(MouseEvent.ROLL_OVER,this.over);
            addEventListener(MouseEvent.ROLL_OUT,this.§_-y1n§);
            addEventListener(MouseEvent.MOUSE_DOWN,this.down);
            addEventListener(MouseEvent.MOUSE_UP,this.up);
         }
         if(param1 && !this.§_-t28§)
         {
            removeEventListener(MouseEvent.ROLL_OVER,this.over);
            removeEventListener(MouseEvent.ROLL_OUT,this.§_-y1n§);
            removeEventListener(MouseEvent.MOUSE_DOWN,this.down);
            removeEventListener(MouseEvent.MOUSE_UP,this.up);
         }
         this.§_-t28§ = param1;
      }
      
      public function get block() : Boolean
      {
         return this.§_-t28§;
      }
      
      public function get sticked() : Boolean
      {
         return this.§_-l2P§;
      }
      
      protected function §_-5U§() : void
      {
         this.play(this.§_-13e§);
      }
      
      protected function §_-aw§() : void
      {
         this.play(this.§_-p2h§);
      }
      
      protected function §_-f17§() : void
      {
         this.play(this.§_-52L§);
      }
      
      private function init() : void
      {
         addChild(this.§_-13e§);
         addChild(this.§_-52L§);
         addChild(this.§_-p2h§);
         if(this.§_-22f§ != null)
         {
            addChild(this.§_-22f§);
         }
         if(this.§_-82k§ != null)
         {
            addChild(this.§_-82k§);
         }
         addEventListener(MouseEvent.ROLL_OVER,this.over);
         addEventListener(MouseEvent.ROLL_OUT,this.§_-y1n§);
         addEventListener(MouseEvent.MOUSE_DOWN,this.down);
         addEventListener(MouseEvent.MOUSE_UP,this.up);
      }
      
      private function over(param1:Event) : void
      {
         if(this.sticked)
         {
            return;
         }
         GameSounds.play(§_-RH§.§_-X3§);
         this.§_-L15§();
         this.§_-f17§();
      }
      
      private function §_-y1n§(param1:Event) : void
      {
         this.sticked = this.sticked;
      }
      
      private function up(param1:Event) : void
      {
         this.sticked = true;
         GameSounds.play(§_-RH§.§_-X3§);
         dispatchEvent(new §_-b2G§(§_-b2G§.SELECT,this));
      }
      
      private function down(param1:Event) : void
      {
         if(this.sticked)
         {
            return;
         }
         this.§_-L15§();
         dispatchEvent(new §_-b2G§(§_-b2G§.CLICK));
         if(this.§_-82k§ != null)
         {
            this.play(this.§_-82k§);
         }
         else
         {
            this.play(this.§_-52L§);
         }
      }
      
      private function play(param1:DisplayObject) : void
      {
         param1.visible = true;
         if(param1 is MovieClip)
         {
            (param1 as MovieClip).play();
         }
      }
      
      private function §_-L15§() : void
      {
         this.§_-13e§.visible = false;
         this.§_-52L§.visible = false;
         this.§_-p2h§.visible = false;
         if(this.§_-22f§ != null)
         {
            this.§_-22f§.visible = false;
         }
         if(this.§_-82k§ != null)
         {
            this.§_-82k§.visible = false;
         }
      }
   }
}

