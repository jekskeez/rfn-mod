package starling.display
{
   import §_-K2c§.Event;
   import §_-K2c§.TouchEvent;
   import §_-K2c§.§_-e2m§;
   import §_-K2c§.§_-sj§;
   import §_-sk§.TextField;
   import flash.geom.Rectangle;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import starling.textures.Texture;
   import starling.utils.§_-G8§;
   import starling.utils.§_-Y1C§;
   
   public class Button extends DisplayObjectContainer
   {
      
      private static const §_-t7§:Number = 50;
      
      private var §_-U2V§:Texture;
      
      private var §_-c1y§:Texture;
      
      private var §_-U2H§:Texture;
      
      private var §_-g1U§:Texture;
      
      private var §_-2I§:Sprite;
      
      private var §_-q28§:§_-jH§;
      
      private var §_-n1Y§:TextField;
      
      private var §_-42x§:Rectangle;
      
      private var §_-Mc§:Sprite;
      
      private var §_-R2f§:Number;
      
      private var §_-52n§:Number;
      
      private var §_-43d§:Number;
      
      private var §_-Y1W§:Number;
      
      private var §_-S1w§:Boolean;
      
      private var §_-32n§:Boolean;
      
      private var §_-W20§:String;
      
      private var §_-x23§:Rectangle;
      
      public function Button(param1:Texture, param2:String = "", param3:Texture = null, param4:Texture = null, param5:Texture = null)
      {
         super();
         if(param1 == null)
         {
            throw new ArgumentError("Texture \'upState\' cannot be null");
         }
         this.§_-U2V§ = param1;
         this.§_-c1y§ = param3;
         this.§_-U2H§ = param4;
         this.§_-g1U§ = param5;
         this.§_-W20§ = §_-Le§.UP;
         this.§_-q28§ = new §_-jH§(param1);
         this.§_-R2f§ = param3 ? 1 : 0.9;
         this.§_-52n§ = this.§_-43d§ = 1;
         this.§_-Y1W§ = param5 ? 1 : 0.5;
         this.§_-32n§ = true;
         this.§_-S1w§ = true;
         this.§_-42x§ = new Rectangle(0,0,this.§_-q28§.width,this.§_-q28§.height);
         this.§_-x23§ = new Rectangle();
         this.§_-2I§ = new Sprite();
         this.§_-2I§.addChild(this.§_-q28§);
         addChild(this.§_-2I§);
         addEventListener(TouchEvent.§_-N1l§,this.§_-V1M§);
         this.§_-V8§ = true;
         this.text = param2;
      }
      
      override public function dispose() : void
      {
         if(this.§_-n1Y§)
         {
            this.§_-n1Y§.dispose();
         }
         super.dispose();
      }
      
      public function §_-T2Q§(param1:Boolean = true) : void
      {
         this.§_-q28§.§_-T2Q§();
         if(param1 && this.§_-n1Y§ != null)
         {
            this.§_-81X§ = new Rectangle(0,0,this.§_-q28§.width,this.§_-q28§.height);
         }
      }
      
      private function §_-Gl§() : void
      {
         if(this.§_-n1Y§ == null)
         {
            this.§_-n1Y§ = new TextField(this.§_-42x§.width,this.§_-42x§.height,"");
            this.§_-n1Y§.vAlign = §_-Y1C§.CENTER;
            this.§_-n1Y§.hAlign = §_-G8§.CENTER;
            this.§_-n1Y§.touchable = false;
            this.§_-n1Y§.§_-M2A§ = true;
            this.§_-n1Y§.§_-T19§ = true;
         }
         this.§_-n1Y§.width = this.§_-42x§.width;
         this.§_-n1Y§.height = this.§_-42x§.height;
         this.§_-n1Y§.x = this.§_-42x§.x;
         this.§_-n1Y§.y = this.§_-42x§.y;
      }
      
      private function §_-V1M§(param1:TouchEvent) : void
      {
         var _loc3_:Boolean = false;
         Mouse.cursor = this.§_-S1w§ && this.§_-32n§ && param1.§_-V1Y§(this) ? MouseCursor.BUTTON : MouseCursor.AUTO;
         var _loc2_:§_-e2m§ = param1.§_-H2o§(this);
         if(!this.§_-32n§)
         {
            return;
         }
         if(_loc2_ == null)
         {
            this.state = §_-Le§.UP;
         }
         else if(_loc2_.§_-Q2S§ == §_-sj§.§_-X2J§)
         {
            this.state = §_-Le§.§_-P1e§;
         }
         else if(_loc2_.§_-Q2S§ == §_-sj§.§_-ML§ && this.§_-W20§ != §_-Le§.DOWN)
         {
            this.§_-x23§ = getBounds(stage,this.§_-x23§);
            this.§_-x23§.inflate(§_-t7§,§_-t7§);
            this.state = §_-Le§.DOWN;
         }
         else if(_loc2_.§_-Q2S§ == §_-sj§.§_-i23§)
         {
            _loc3_ = this.§_-x23§.contains(_loc2_.§_-n2h§,_loc2_.§_-Zv§);
            if(this.§_-W20§ == §_-Le§.DOWN && !_loc3_)
            {
               this.state = §_-Le§.UP;
            }
            else if(this.§_-W20§ == §_-Le§.UP && _loc3_)
            {
               this.state = §_-Le§.DOWN;
            }
         }
         else if(_loc2_.§_-Q2S§ == §_-sj§.§_-L23§ && this.§_-W20§ == §_-Le§.DOWN)
         {
            this.state = §_-Le§.UP;
            if(!_loc2_.§_-91e§)
            {
               §_-g11§(Event.§_-cp§,true);
            }
         }
      }
      
      public function get state() : String
      {
         return this.§_-W20§;
      }
      
      public function set state(param1:String) : void
      {
         this.§_-W20§ = param1;
         this.§_-X2§();
      }
      
      private function §_-X2§() : void
      {
         this.§_-2I§.x = this.§_-2I§.y = 0;
         this.§_-2I§.scaleX = this.§_-2I§.scaleY = this.§_-2I§.alpha = 1;
         switch(this.§_-W20§)
         {
            case §_-Le§.DOWN:
               this.§_-Y1P§(this.§_-c1y§);
               this.§_-2I§.alpha = this.§_-43d§;
               this.§_-2I§.scaleX = this.§_-2I§.scaleY = this.§_-R2f§;
               this.§_-2I§.x = (1 - this.§_-R2f§) / 2 * this.§_-q28§.width;
               this.§_-2I§.y = (1 - this.§_-R2f§) / 2 * this.§_-q28§.height;
               break;
            case §_-Le§.UP:
               this.§_-Y1P§(this.§_-U2V§);
               break;
            case §_-Le§.§_-P1e§:
               this.§_-Y1P§(this.§_-U2H§);
               this.§_-2I§.scaleX = this.§_-2I§.scaleY = this.§_-52n§;
               this.§_-2I§.x = (1 - this.§_-52n§) / 2 * this.§_-q28§.width;
               this.§_-2I§.y = (1 - this.§_-52n§) / 2 * this.§_-q28§.height;
               break;
            case §_-Le§.§_-hq§:
               this.§_-Y1P§(this.§_-g1U§);
               this.§_-2I§.alpha = this.§_-Y1W§;
               break;
            default:
               throw new ArgumentError("Invalid button state: " + this.§_-W20§);
         }
      }
      
      private function §_-Y1P§(param1:Texture) : void
      {
         this.§_-q28§.texture = param1 ? param1 : this.§_-U2V§;
      }
      
      public function get §_-iY§() : Number
      {
         return this.§_-R2f§;
      }
      
      public function set §_-iY§(param1:Number) : void
      {
         this.§_-R2f§ = param1;
         if(this.§_-W20§ == §_-Le§.DOWN)
         {
            this.§_-X2§();
         }
      }
      
      public function get §_-B1b§() : Number
      {
         return this.§_-52n§;
      }
      
      public function set §_-B1b§(param1:Number) : void
      {
         this.§_-52n§ = param1;
         if(this.§_-W20§ == §_-Le§.§_-P1e§)
         {
            this.§_-X2§();
         }
      }
      
      public function get §_-ZW§() : Number
      {
         return this.§_-43d§;
      }
      
      public function set §_-ZW§(param1:Number) : void
      {
         this.§_-43d§ = param1;
         if(this.§_-W20§ == §_-Le§.DOWN)
         {
            this.§_-X2§();
         }
      }
      
      public function get §_-wx§() : Number
      {
         return this.§_-Y1W§;
      }
      
      public function set §_-wx§(param1:Number) : void
      {
         this.§_-Y1W§ = param1;
         if(this.§_-W20§ == §_-Le§.§_-hq§)
         {
            this.§_-X2§();
         }
      }
      
      public function get enabled() : Boolean
      {
         return this.§_-32n§;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(this.§_-32n§ != param1)
         {
            this.§_-32n§ = param1;
            this.state = param1 ? §_-Le§.UP : §_-Le§.§_-hq§;
         }
      }
      
      public function get text() : String
      {
         return this.§_-n1Y§ ? this.§_-n1Y§.text : "";
      }
      
      public function set text(param1:String) : void
      {
         if(param1.length == 0)
         {
            if(this.§_-n1Y§)
            {
               this.§_-n1Y§.text = param1;
               this.§_-n1Y§.removeFromParent();
            }
         }
         else
         {
            this.§_-Gl§();
            this.§_-n1Y§.text = param1;
            if(this.§_-n1Y§.parent == null)
            {
               this.§_-2I§.addChild(this.§_-n1Y§);
            }
         }
      }
      
      public function get §_-B1l§() : String
      {
         return this.§_-n1Y§ ? this.§_-n1Y§.§_-B1l§ : "Verdana";
      }
      
      public function set §_-B1l§(param1:String) : void
      {
         this.§_-Gl§();
         this.§_-n1Y§.§_-B1l§ = param1;
      }
      
      public function get fontSize() : Number
      {
         return this.§_-n1Y§ ? this.§_-n1Y§.fontSize : 12;
      }
      
      public function set fontSize(param1:Number) : void
      {
         this.§_-Gl§();
         this.§_-n1Y§.fontSize = param1;
      }
      
      public function get fontColor() : uint
      {
         return this.§_-n1Y§ ? this.§_-n1Y§.color : 0;
      }
      
      public function set fontColor(param1:uint) : void
      {
         this.§_-Gl§();
         this.§_-n1Y§.color = param1;
      }
      
      public function get §_-DK§() : Boolean
      {
         return this.§_-n1Y§ ? this.§_-n1Y§.bold : false;
      }
      
      public function set §_-DK§(param1:Boolean) : void
      {
         this.§_-Gl§();
         this.§_-n1Y§.bold = param1;
      }
      
      public function get upState() : Texture
      {
         return this.§_-U2V§;
      }
      
      public function set upState(param1:Texture) : void
      {
         if(param1 == null)
         {
            throw new ArgumentError("Texture \'upState\' cannot be null");
         }
         if(this.§_-U2V§ != param1)
         {
            this.§_-U2V§ = param1;
            if(this.§_-W20§ == §_-Le§.UP || this.§_-W20§ == §_-Le§.§_-hq§ && this.§_-g1U§ == null || this.§_-W20§ == §_-Le§.DOWN && this.§_-c1y§ == null || this.§_-W20§ == §_-Le§.§_-P1e§ && this.§_-U2H§ == null)
            {
               this.§_-Y1P§(param1);
            }
         }
      }
      
      public function get downState() : Texture
      {
         return this.§_-c1y§;
      }
      
      public function set downState(param1:Texture) : void
      {
         if(this.§_-c1y§ != param1)
         {
            this.§_-c1y§ = param1;
            if(this.§_-W20§ == §_-Le§.DOWN)
            {
               this.§_-Y1P§(param1);
            }
         }
      }
      
      public function get overState() : Texture
      {
         return this.§_-U2H§;
      }
      
      public function set overState(param1:Texture) : void
      {
         if(this.§_-U2H§ != param1)
         {
            this.§_-U2H§ = param1;
            if(this.§_-W20§ == §_-Le§.§_-P1e§)
            {
               this.§_-Y1P§(param1);
            }
         }
      }
      
      public function get §_-O1Z§() : Texture
      {
         return this.§_-g1U§;
      }
      
      public function set §_-O1Z§(param1:Texture) : void
      {
         if(this.§_-g1U§ != param1)
         {
            this.§_-g1U§ = param1;
            if(this.§_-W20§ == §_-Le§.§_-hq§)
            {
               this.§_-Y1P§(param1);
            }
         }
      }
      
      public function get §_-Ic§() : String
      {
         return this.§_-n1Y§ ? this.§_-n1Y§.vAlign : §_-Y1C§.CENTER;
      }
      
      public function set §_-Ic§(param1:String) : void
      {
         this.§_-Gl§();
         this.§_-n1Y§.vAlign = param1;
      }
      
      public function get §_-93A§() : String
      {
         return this.§_-n1Y§ ? this.§_-n1Y§.hAlign : §_-G8§.CENTER;
      }
      
      public function set §_-93A§(param1:String) : void
      {
         this.§_-Gl§();
         this.§_-n1Y§.hAlign = param1;
      }
      
      public function get §_-81X§() : Rectangle
      {
         return this.§_-42x§.clone();
      }
      
      public function set §_-81X§(param1:Rectangle) : void
      {
         this.§_-42x§ = param1.clone();
         this.§_-Gl§();
      }
      
      public function get color() : uint
      {
         return this.§_-q28§.color;
      }
      
      public function set color(param1:uint) : void
      {
         this.§_-q28§.color = param1;
      }
      
      public function get smoothing() : String
      {
         return this.§_-q28§.smoothing;
      }
      
      public function set smoothing(param1:String) : void
      {
         this.§_-q28§.smoothing = param1;
      }
      
      public function get §_-t2U§() : Sprite
      {
         if(this.§_-Mc§ == null)
         {
            this.§_-Mc§ = new Sprite();
         }
         this.§_-2I§.addChild(this.§_-Mc§);
         return this.§_-Mc§;
      }
      
      override public function get useHandCursor() : Boolean
      {
         return this.§_-S1w§;
      }
      
      override public function set useHandCursor(param1:Boolean) : void
      {
         this.§_-S1w§ = param1;
      }
   }
}

