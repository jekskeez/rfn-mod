package starling.display
{
   import §_-b5§.TextField;
   import §_-f1T§.Event;
   import §_-f1T§.TouchEvent;
   import §_-f1T§.§_-01Z§;
   import §_-f1T§.§_-J1a§;
   import flash.geom.Rectangle;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import starling.textures.Texture;
   import starling.utils.§_-42b§;
   import starling.utils.§_-U2x§;
   
   public class Button extends DisplayObjectContainer
   {
      
      private static const §_-v2B§:Number = 50;
      
      private var §_-g2o§:Texture;
      
      private var §_-310§:Texture;
      
      private var §_-j1V§:Texture;
      
      private var §_-g1i§:Texture;
      
      private var §_-z1G§:Sprite;
      
      private var §_-Mz§:§_-I2q§;
      
      private var §_-g2D§:TextField;
      
      private var §_-Os§:Rectangle;
      
      private var §_-a2J§:Sprite;
      
      private var §_-73g§:Number;
      
      private var §_-h1t§:Number;
      
      private var §_-82x§:Number;
      
      private var §_-U2r§:Number;
      
      private var §_-K1Q§:Boolean;
      
      private var §_-b2R§:Boolean;
      
      private var §_-Lz§:String;
      
      private var §_-l1r§:Rectangle;
      
      public function Button(param1:Texture, param2:String = "", param3:Texture = null, param4:Texture = null, param5:Texture = null)
      {
         super();
         if(param1 == null)
         {
            throw new ArgumentError("Texture \'upState\' cannot be null");
         }
         this.§_-g2o§ = param1;
         this.§_-310§ = param3;
         this.§_-j1V§ = param4;
         this.§_-g1i§ = param5;
         this.§_-Lz§ = §_-s11§.UP;
         this.§_-Mz§ = new §_-I2q§(param1);
         this.§_-73g§ = param3 ? 1 : 0.9;
         this.§_-h1t§ = this.§_-82x§ = 1;
         this.§_-U2r§ = param5 ? 1 : 0.5;
         this.§_-b2R§ = true;
         this.§_-K1Q§ = true;
         this.§_-Os§ = new Rectangle(0,0,this.§_-Mz§.width,this.§_-Mz§.height);
         this.§_-l1r§ = new Rectangle();
         this.§_-z1G§ = new Sprite();
         this.§_-z1G§.addChild(this.§_-Mz§);
         addChild(this.§_-z1G§);
         addEventListener(TouchEvent.§_-qu§,this.§_-51§);
         this.§_-03v§ = true;
         this.text = param2;
      }
      
      override public function dispose() : void
      {
         if(this.§_-g2D§)
         {
            this.§_-g2D§.dispose();
         }
         super.dispose();
      }
      
      public function §_-D25§(param1:Boolean = true) : void
      {
         this.§_-Mz§.§_-D25§();
         if(param1 && this.§_-g2D§ != null)
         {
            this.§_-dA§ = new Rectangle(0,0,this.§_-Mz§.width,this.§_-Mz§.height);
         }
      }
      
      private function §_-wn§() : void
      {
         if(this.§_-g2D§ == null)
         {
            this.§_-g2D§ = new TextField(this.§_-Os§.width,this.§_-Os§.height,"");
            this.§_-g2D§.vAlign = §_-42b§.CENTER;
            this.§_-g2D§.hAlign = §_-U2x§.CENTER;
            this.§_-g2D§.touchable = false;
            this.§_-g2D§.§_-j1n§ = true;
            this.§_-g2D§.§_-32r§ = true;
         }
         this.§_-g2D§.width = this.§_-Os§.width;
         this.§_-g2D§.height = this.§_-Os§.height;
         this.§_-g2D§.x = this.§_-Os§.x;
         this.§_-g2D§.y = this.§_-Os§.y;
      }
      
      private function §_-51§(param1:TouchEvent) : void
      {
         var _loc3_:Boolean = false;
         Mouse.cursor = this.§_-K1Q§ && this.§_-b2R§ && param1.§_-BA§(this) ? MouseCursor.BUTTON : MouseCursor.AUTO;
         var _loc2_:§_-J1a§ = param1.§_-d2S§(this);
         if(!this.§_-b2R§)
         {
            return;
         }
         if(_loc2_ == null)
         {
            this.state = §_-s11§.UP;
         }
         else if(_loc2_.§_-iR§ == §_-01Z§.§_-zX§)
         {
            this.state = §_-s11§.§_-X3§;
         }
         else if(_loc2_.§_-iR§ == §_-01Z§.§_-N1v§ && this.§_-Lz§ != §_-s11§.DOWN)
         {
            this.§_-l1r§ = getBounds(stage,this.§_-l1r§);
            this.§_-l1r§.inflate(§_-v2B§,§_-v2B§);
            this.state = §_-s11§.DOWN;
         }
         else if(_loc2_.§_-iR§ == §_-01Z§.§_-kg§)
         {
            _loc3_ = this.§_-l1r§.contains(_loc2_.§_-ca§,_loc2_.§_-n2z§);
            if(this.§_-Lz§ == §_-s11§.DOWN && !_loc3_)
            {
               this.state = §_-s11§.UP;
            }
            else if(this.§_-Lz§ == §_-s11§.UP && _loc3_)
            {
               this.state = §_-s11§.DOWN;
            }
         }
         else if(_loc2_.§_-iR§ == §_-01Z§.§_-1Z§ && this.§_-Lz§ == §_-s11§.DOWN)
         {
            this.state = §_-s11§.UP;
            if(!_loc2_.§_-61F§)
            {
               §_-12v§(Event.§_-v1C§,true);
            }
         }
      }
      
      public function get state() : String
      {
         return this.§_-Lz§;
      }
      
      public function set state(param1:String) : void
      {
         this.§_-Lz§ = param1;
         this.§_-x2Z§();
      }
      
      private function §_-x2Z§() : void
      {
         this.§_-z1G§.x = this.§_-z1G§.y = 0;
         this.§_-z1G§.scaleX = this.§_-z1G§.scaleY = this.§_-z1G§.alpha = 1;
         switch(this.§_-Lz§)
         {
            case §_-s11§.DOWN:
               this.§_-X2p§(this.§_-310§);
               this.§_-z1G§.alpha = this.§_-82x§;
               this.§_-z1G§.scaleX = this.§_-z1G§.scaleY = this.§_-73g§;
               this.§_-z1G§.x = (1 - this.§_-73g§) / 2 * this.§_-Mz§.width;
               this.§_-z1G§.y = (1 - this.§_-73g§) / 2 * this.§_-Mz§.height;
               break;
            case §_-s11§.UP:
               this.§_-X2p§(this.§_-g2o§);
               break;
            case §_-s11§.§_-X3§:
               this.§_-X2p§(this.§_-j1V§);
               this.§_-z1G§.scaleX = this.§_-z1G§.scaleY = this.§_-h1t§;
               this.§_-z1G§.x = (1 - this.§_-h1t§) / 2 * this.§_-Mz§.width;
               this.§_-z1G§.y = (1 - this.§_-h1t§) / 2 * this.§_-Mz§.height;
               break;
            case §_-s11§.§_-7W§:
               this.§_-X2p§(this.§_-g1i§);
               this.§_-z1G§.alpha = this.§_-U2r§;
               break;
            default:
               throw new ArgumentError("Invalid button state: " + this.§_-Lz§);
         }
      }
      
      private function §_-X2p§(param1:Texture) : void
      {
         this.§_-Mz§.texture = param1 ? param1 : this.§_-g2o§;
      }
      
      public function get §_-f1y§() : Number
      {
         return this.§_-73g§;
      }
      
      public function set §_-f1y§(param1:Number) : void
      {
         this.§_-73g§ = param1;
         if(this.§_-Lz§ == §_-s11§.DOWN)
         {
            this.§_-x2Z§();
         }
      }
      
      public function get §_-01T§() : Number
      {
         return this.§_-h1t§;
      }
      
      public function set §_-01T§(param1:Number) : void
      {
         this.§_-h1t§ = param1;
         if(this.§_-Lz§ == §_-s11§.§_-X3§)
         {
            this.§_-x2Z§();
         }
      }
      
      public function get §_-j1E§() : Number
      {
         return this.§_-82x§;
      }
      
      public function set §_-j1E§(param1:Number) : void
      {
         this.§_-82x§ = param1;
         if(this.§_-Lz§ == §_-s11§.DOWN)
         {
            this.§_-x2Z§();
         }
      }
      
      public function get §_-V2F§() : Number
      {
         return this.§_-U2r§;
      }
      
      public function set §_-V2F§(param1:Number) : void
      {
         this.§_-U2r§ = param1;
         if(this.§_-Lz§ == §_-s11§.§_-7W§)
         {
            this.§_-x2Z§();
         }
      }
      
      public function get enabled() : Boolean
      {
         return this.§_-b2R§;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(this.§_-b2R§ != param1)
         {
            this.§_-b2R§ = param1;
            this.state = param1 ? §_-s11§.UP : §_-s11§.§_-7W§;
         }
      }
      
      public function get text() : String
      {
         return this.§_-g2D§ ? this.§_-g2D§.text : "";
      }
      
      public function set text(param1:String) : void
      {
         if(param1.length == 0)
         {
            if(this.§_-g2D§)
            {
               this.§_-g2D§.text = param1;
               this.§_-g2D§.removeFromParent();
            }
         }
         else
         {
            this.§_-wn§();
            this.§_-g2D§.text = param1;
            if(this.§_-g2D§.parent == null)
            {
               this.§_-z1G§.addChild(this.§_-g2D§);
            }
         }
      }
      
      public function get §_-11j§() : String
      {
         return this.§_-g2D§ ? this.§_-g2D§.§_-11j§ : "Verdana";
      }
      
      public function set §_-11j§(param1:String) : void
      {
         this.§_-wn§();
         this.§_-g2D§.§_-11j§ = param1;
      }
      
      public function get fontSize() : Number
      {
         return this.§_-g2D§ ? this.§_-g2D§.fontSize : 12;
      }
      
      public function set fontSize(param1:Number) : void
      {
         this.§_-wn§();
         this.§_-g2D§.fontSize = param1;
      }
      
      public function get fontColor() : uint
      {
         return this.§_-g2D§ ? this.§_-g2D§.color : 0;
      }
      
      public function set fontColor(param1:uint) : void
      {
         this.§_-wn§();
         this.§_-g2D§.color = param1;
      }
      
      public function get §_-L2g§() : Boolean
      {
         return this.§_-g2D§ ? this.§_-g2D§.bold : false;
      }
      
      public function set §_-L2g§(param1:Boolean) : void
      {
         this.§_-wn§();
         this.§_-g2D§.bold = param1;
      }
      
      public function get upState() : Texture
      {
         return this.§_-g2o§;
      }
      
      public function set upState(param1:Texture) : void
      {
         if(param1 == null)
         {
            throw new ArgumentError("Texture \'upState\' cannot be null");
         }
         if(this.§_-g2o§ != param1)
         {
            this.§_-g2o§ = param1;
            if(this.§_-Lz§ == §_-s11§.UP || this.§_-Lz§ == §_-s11§.§_-7W§ && this.§_-g1i§ == null || this.§_-Lz§ == §_-s11§.DOWN && this.§_-310§ == null || this.§_-Lz§ == §_-s11§.§_-X3§ && this.§_-j1V§ == null)
            {
               this.§_-X2p§(param1);
            }
         }
      }
      
      public function get downState() : Texture
      {
         return this.§_-310§;
      }
      
      public function set downState(param1:Texture) : void
      {
         if(this.§_-310§ != param1)
         {
            this.§_-310§ = param1;
            if(this.§_-Lz§ == §_-s11§.DOWN)
            {
               this.§_-X2p§(param1);
            }
         }
      }
      
      public function get overState() : Texture
      {
         return this.§_-j1V§;
      }
      
      public function set overState(param1:Texture) : void
      {
         if(this.§_-j1V§ != param1)
         {
            this.§_-j1V§ = param1;
            if(this.§_-Lz§ == §_-s11§.§_-X3§)
            {
               this.§_-X2p§(param1);
            }
         }
      }
      
      public function get §_-o1k§() : Texture
      {
         return this.§_-g1i§;
      }
      
      public function set §_-o1k§(param1:Texture) : void
      {
         if(this.§_-g1i§ != param1)
         {
            this.§_-g1i§ = param1;
            if(this.§_-Lz§ == §_-s11§.§_-7W§)
            {
               this.§_-X2p§(param1);
            }
         }
      }
      
      public function get §_-tA§() : String
      {
         return this.§_-g2D§ ? this.§_-g2D§.vAlign : §_-42b§.CENTER;
      }
      
      public function set §_-tA§(param1:String) : void
      {
         this.§_-wn§();
         this.§_-g2D§.vAlign = param1;
      }
      
      public function get §_-2C§() : String
      {
         return this.§_-g2D§ ? this.§_-g2D§.hAlign : §_-U2x§.CENTER;
      }
      
      public function set §_-2C§(param1:String) : void
      {
         this.§_-wn§();
         this.§_-g2D§.hAlign = param1;
      }
      
      public function get §_-dA§() : Rectangle
      {
         return this.§_-Os§.clone();
      }
      
      public function set §_-dA§(param1:Rectangle) : void
      {
         this.§_-Os§ = param1.clone();
         this.§_-wn§();
      }
      
      public function get color() : uint
      {
         return this.§_-Mz§.color;
      }
      
      public function set color(param1:uint) : void
      {
         this.§_-Mz§.color = param1;
      }
      
      public function get smoothing() : String
      {
         return this.§_-Mz§.smoothing;
      }
      
      public function set smoothing(param1:String) : void
      {
         this.§_-Mz§.smoothing = param1;
      }
      
      public function get §_-d1g§() : Sprite
      {
         if(this.§_-a2J§ == null)
         {
            this.§_-a2J§ = new Sprite();
         }
         this.§_-z1G§.addChild(this.§_-a2J§);
         return this.§_-a2J§;
      }
      
      override public function get useHandCursor() : Boolean
      {
         return this.§_-K1Q§;
      }
      
      override public function set useHandCursor(param1:Boolean) : void
      {
         this.§_-K1Q§ = param1;
      }
   }
}

