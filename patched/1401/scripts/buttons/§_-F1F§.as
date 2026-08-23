package buttons
{
   import events.§_-4Y§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   
   public class §_-F1F§ extends Sprite
   {
      
      protected var §_-e1q§:DisplayObject;
      
      protected var §_-r2k§:DisplayObject;
      
      protected var §_-c2r§:DisplayObject;
      
      protected var §_-n1B§:DisplayObject;
      
      private var §_-XQ§:DisplayObject;
      
      private var §_-CP§:Boolean;
      
      private var §_-2l§:Boolean = false;
      
      public function §_-F1F§(param1:DisplayObject, param2:DisplayObject = null, param3:DisplayObject = null, param4:DisplayObject = null, param5:DisplayObject = null, param6:Sprite = null)
      {
         var _loc7_:SimpleButton = null;
         super();
         this.buttonMode = true;
         this.mouseChildren = false;
         if(param1 is SimpleButton)
         {
            _loc7_ = param1 as SimpleButton;
            this.§_-e1q§ = _loc7_.upState;
            this.§_-r2k§ = _loc7_.overState;
            this.§_-n1B§ = _loc7_.downState;
            this.§_-c2r§ = _loc7_.downState;
            this.§_-XQ§ = _loc7_.upState;
            this.hitArea = param6 ? param6 : _loc7_.upState as Sprite;
         }
         else
         {
            this.§_-e1q§ = param1;
            this.§_-r2k§ = param2;
            this.§_-n1B§ = param3;
            this.§_-c2r§ = param4 ? param4 : param3;
            this.§_-XQ§ = param5;
            this.hitArea = param6;
         }
         this.init();
         this.sticked = false;
      }
      
      public function §_-xT§(param1:SimpleButton) : void
      {
         removeChild(this.§_-e1q§);
         removeChild(this.§_-r2k§);
         removeChild(this.§_-n1B§);
         this.§_-e1q§ = param1.upState;
         this.§_-r2k§ = param1.overState;
         this.§_-n1B§ = param1.downState;
         this.§_-c2r§ = param1.downState;
         addChildAt(this.§_-e1q§,0);
         addChildAt(this.§_-r2k§,0);
         addChildAt(this.§_-n1B§,0);
         this.sticked = this.sticked;
      }
      
      public function set sticked(param1:Boolean) : void
      {
         this.§_-c2M§();
         if(param1)
         {
            this.§_-71W§();
         }
         else
         {
            this.§_-m2l§();
         }
         this.§_-CP§ = param1;
      }
      
      public function set block(param1:Boolean) : void
      {
         if(param1 == this.block)
         {
            return;
         }
         this.§_-c2M§();
         if(param1)
         {
            this.play(this.§_-XQ§);
         }
         else
         {
            this.play(this.§_-e1q§);
         }
         if(!param1 && this.§_-2l§)
         {
            addEventListener(MouseEvent.ROLL_OVER,this.over);
            addEventListener(MouseEvent.ROLL_OUT,this.§_-51G§);
            addEventListener(MouseEvent.MOUSE_DOWN,this.down);
            addEventListener(MouseEvent.MOUSE_UP,this.up);
         }
         if(param1 && !this.§_-2l§)
         {
            removeEventListener(MouseEvent.ROLL_OVER,this.over);
            removeEventListener(MouseEvent.ROLL_OUT,this.§_-51G§);
            removeEventListener(MouseEvent.MOUSE_DOWN,this.down);
            removeEventListener(MouseEvent.MOUSE_UP,this.up);
         }
         this.§_-2l§ = param1;
      }
      
      public function get block() : Boolean
      {
         return this.§_-2l§;
      }
      
      public function get sticked() : Boolean
      {
         return this.§_-CP§;
      }
      
      protected function §_-m2l§() : void
      {
         this.play(this.§_-e1q§);
      }
      
      protected function §_-71W§() : void
      {
         this.play(this.§_-c2r§);
      }
      
      protected function §_-Rf§() : void
      {
         this.play(this.§_-r2k§);
      }
      
      private function init() : void
      {
         addChild(this.§_-e1q§);
         addChild(this.§_-r2k§);
         addChild(this.§_-c2r§);
         if(this.§_-XQ§ != null)
         {
            addChild(this.§_-XQ§);
         }
         if(this.§_-n1B§ != null)
         {
            addChild(this.§_-n1B§);
         }
         addEventListener(MouseEvent.ROLL_OVER,this.over);
         addEventListener(MouseEvent.ROLL_OUT,this.§_-51G§);
         addEventListener(MouseEvent.MOUSE_DOWN,this.down);
         addEventListener(MouseEvent.MOUSE_UP,this.up);
      }
      
      private function over(param1:Event) : void
      {
         if(this.sticked)
         {
            return;
         }
         GameSounds.play(§_-43Z§.§_-P1e§);
         this.§_-c2M§();
         this.§_-Rf§();
      }
      
      private function §_-51G§(param1:Event) : void
      {
         this.sticked = this.sticked;
      }
      
      private function up(param1:Event) : void
      {
         this.sticked = true;
         GameSounds.play(§_-43Z§.§_-P1e§);
         dispatchEvent(new §_-4Y§(§_-4Y§.SELECT,this));
      }
      
      private function down(param1:Event) : void
      {
         if(this.sticked)
         {
            return;
         }
         this.§_-c2M§();
         dispatchEvent(new §_-4Y§(§_-4Y§.CLICK));
         if(this.§_-n1B§ != null)
         {
            this.play(this.§_-n1B§);
         }
         else
         {
            this.play(this.§_-r2k§);
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
      
      private function §_-c2M§() : void
      {
         this.§_-e1q§.visible = false;
         this.§_-r2k§.visible = false;
         this.§_-c2r§.visible = false;
         if(this.§_-XQ§ != null)
         {
            this.§_-XQ§.visible = false;
         }
         if(this.§_-n1B§ != null)
         {
            this.§_-n1B§.visible = false;
         }
      }
   }
}

